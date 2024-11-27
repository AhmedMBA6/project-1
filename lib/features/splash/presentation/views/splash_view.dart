import 'package:first_project/core/functions/navigation.dart';
import 'package:first_project/core/utils/app_strings.dart';
import 'package:first_project/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style,
        ),
      ),
    );
  }
}

void delayedNavigate(context) {
    Future.delayed(const Duration(seconds: 3), (){customReplacementNavigate(context, "/onBoarding");},);
  }
