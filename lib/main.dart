import 'package:first_project/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Museum());
}

class Museum extends StatelessWidget {
  const Museum({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
