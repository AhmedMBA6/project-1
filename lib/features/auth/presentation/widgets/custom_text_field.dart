import 'package:first_project/core/utils/app_colors.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText, this.onChanged, this.onFieldSubmitted, this.suffixIcon, this.obscureText});
final String labelText;
final Function(String)? onChanged;
final Function(String)? onFieldSubmitted;
final bool? obscureText;
final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 24),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (value) {
          if (value!.isEmpty) {
            return "this field is required";
          }else {
            return null;
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        border: getBorderStyle(),
        labelText: labelText,
        labelStyle: CustomTextStyles.poppins500style18,
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
        suffixIcon: suffixIcon,
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