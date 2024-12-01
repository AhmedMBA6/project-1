import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import '../../../../core/functions/custom_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit/auth_cubit.dart';
import 'custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/home")
              : showToast("Please verify your account");
        } else if (state is SignInFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: authCubit.signInFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                CustomTextFormField(
                  obscureText: authCubit.obscurePasswordTextValue,
                  suffixIcon: IconButton(
                      icon: Icon(
                        authCubit.obscurePasswordTextValue == true
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        authCubit.obscurePasswordText();
                      }),
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const ForgotPasswordTextWidget(),
                const SizedBox(height: 102),
                state is SignInLoadingState
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : CustomBtn(
                        onPressed: () async {
                          if (authCubit.signInFormKey.currentState!
                              .validate()) {
                            await authCubit.signInWithEmailAndPassword();
                          }
                        },
                        text: AppStrings.signIn,
                      ),
              ],
            ));
      },
    );
  }
}
