import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:career_craft/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const CareerCraft());
}

class CareerCraft extends StatelessWidget {
  const CareerCraft({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //make another one then delete it
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Career Craft',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
