import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordKey = GlobalKey();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
     await addUserProfile();
     await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailureState(
            errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailureState(
            errorMessage: "The account already exists for that email."));
      } else if (e.code == 'invalid-email') {
        emit(SignupFailureState(
            errorMessage: "Try agian, that email is invaild."));
      } else {
        emit(SignupFailureState(errorMessage: e.code));
      }
    } catch (e) {
      emit(SignupFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmail() async{
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }


  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: "Wrong password provided for that user."));
      } else {
        emit(
            SignInFailureState(errorMessage: "Check your Email and Password."));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: e.toString()));
    }
  }

  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

 void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

 Future<void> resetPasswordWithLink()async{
    try {
      emit(ResetPasswordLoadingState());
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
  emit(ResetPasswordSuccessState());
} on Exception catch (e) {
  emit(ResetPasswordFailureState(errorMessage: e.toString()));
}
  }

 Future<void> addUserProfile()async{
    CollectionReference users = FirebaseFirestore.instance.collection("users");
   await users.add({
      "email": emailAddress,
      "first_name": fristName,
      "last_name": lastName,
    });
  }
}
