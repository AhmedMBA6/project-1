import 'package:first_project/app/museum_app.dart';
import 'package:first_project/core/database/cache/cache_helper.dart';
import 'package:first_project/core/functions/check_state_changes.dart';
import 'package:first_project/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
    checkStateChanges();
  runApp(const Museum());
}
