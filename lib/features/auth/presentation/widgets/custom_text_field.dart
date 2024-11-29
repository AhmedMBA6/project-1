import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});
final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 24),
      child: TextFormField(
      decoration: InputDecoration(
        border: getBorderStyle(),
        labelText: labelText,
        labelStyle: CustomTextStyles.poppins500style18,
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
      ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey),
  );
}