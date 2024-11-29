import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:first_project/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: AppStrings.iHaveAgreeTo,
              style: CustomTextStyles.poppins400style12),
          TextSpan(
              text: AppStrings.ourTermsAndCondition,
              style: CustomTextStyles.poppins400style12
                  .copyWith(decoration: TextDecoration.underline)),
        ]))
      ],
    );
  }
}
