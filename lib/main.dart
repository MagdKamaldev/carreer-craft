import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CareerCraft());
}

class CareerCraft extends StatelessWidget {
  const CareerCraft({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Career Craft',
      theme: theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
