import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/core/database/cache/cache_helper.dart';
import 'package:first_project/core/functions/navigation.dart';
import 'package:first_project/core/services/service_locator.dart';
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
   bool isOnBoardingVisited =  getIt<CacheHelper>().getData(key: "isOnBoardingVisited" )?? false;
if (isOnBoardingVisited ==true) {
  FirebaseAuth.instance.currentUser == null ?
  delayedNavigate(context, "/signIn") : FirebaseAuth.instance.currentUser!.emailVerified == true ? delayedNavigate(context, "/homeNavBar") : delayedNavigate(context, "/signIn");
}else{
delayedNavigate(context, "/onBoarding");
}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}

void delayedNavigate(context, path) {
    Future.delayed(const Duration(seconds: 3), (){customReplacementNavigate(context, path);},);
  }
