import '../../../../core/functions/custom_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit/auth_cubit.dart';
import 'custom_text_field.dart';
import 'terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast("Successfully, Check your email to verfiy your account.");
          customReplacementNavigate(context, "/signIn");
        } else if (state is SignupFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: authCubit.signupFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.fristName,
                  onChanged: (fristName) {
                    authCubit.fristName = fristName;
                  },
                ),
                CustomTextFormField(
                  labelText: AppStrings.lastName,
                  onChanged: (lastName) {
                    authCubit.lastName = lastName;
                  },
                ),
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
                        BlocProvider.of<AuthCubit>(context).obscurePasswordText();
                      }),
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                const TermsAndConditions(),
                const SizedBox(height: 88),
                state is SignupLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      color: authCubit.termsAndConditionCheckBoxValue == false
                          ? AppColors.grey
                          : null,
                       onPressed: () async{
                        if (authCubit.termsAndConditionCheckBoxValue == true) {
                          if (authCubit.signupFormKey.currentState!
                              .validate()) {
                           await BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
                          }
                        }
                      },
                        text: AppStrings.signUp,
                      ),
              ],
            ));
      },
    );
  }
}
