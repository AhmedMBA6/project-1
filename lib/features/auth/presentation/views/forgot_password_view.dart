import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/features/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:first_project/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:first_project/features/auth/presentation/widgets/forgot_password_subtitle.dart';
import 'package:first_project/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 108,
            ),
          ),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPassword),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: ForgotPasswordImage(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle(),),
          SliverToBoxAdapter(child: CustomForgotPasswordForm(),)
        ],
      ),
    );
  }
}