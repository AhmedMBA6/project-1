import 'package:first_project/core/functions/custom_toast.dart';
import 'package:first_project/core/functions/navigation.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/cubit/auth_cubit.dart';
import 'custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is ResetPasswordSuccessState){
          showToast("Check your Email To Reset your Password");
          customReplacementNavigate(context, "/signIn");
        }else if(state is ResetPasswordFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: authCubit.forgotPasswordKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authCubit.emailAddress = emailAddress;
                    },
                  ),
                  const SizedBox(
                    height: 129,
                  ),
                  state is ResetPasswordLoadingState
                      ? CircularProgressIndicator(color: AppColors.primaryColor)
                      : CustomBtn(
                          onPressed: () async {
                            if (authCubit.forgotPasswordKey.currentState!
                                .validate()) {
                              await authCubit.resetPasswordWithLink();
                            }
                          },
                          text: AppStrings.sendResetPasswordLink,
                        ),
                ],
              )),
        );
      },
    );
  }
}
