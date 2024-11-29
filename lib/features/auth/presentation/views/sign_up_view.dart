import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/widgets/custom_btn.dart';
import 'package:first_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:first_project/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:first_project/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:first_project/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 152)),
            const SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.welcome),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.fristName)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.lastName)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.emailAddress)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.password)),
            const SliverToBoxAdapter(child: TermsAndConditions()),
            SliverToBoxAdapter(
              child: CustomBtn(
                text: AppStrings.signUp,
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
            const SliverToBoxAdapter(
                child: HaveAnAccountWidget(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.signIn,
            ))
          ],
        ),
      ),
    );
  }
}
