import 'package:first_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static final pacifico400style = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: "Pacifico"
  );

  static const poppins500style = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: "Poppins"
  );
  static const poppins300style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: "Poppins"
  );
}