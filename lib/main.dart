import 'package:first_project/core/routes/app_router.dart';
import 'package:first_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Museum());
}

class Museum extends StatelessWidget {
  const Museum({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
