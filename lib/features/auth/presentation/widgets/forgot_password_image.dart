import 'package:first_project/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 235,
      child: Image.asset(Assets.imagesForgotPassword1),
    );
  }
}
