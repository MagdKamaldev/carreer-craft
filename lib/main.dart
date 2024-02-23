// ignore_for_file: deprecated_member_use
import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/core/utils/locale.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:career_craft/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:career_craft/features/splash/presentation/views/splash_view.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox(kUserBox);
  await Hive.openBox(kTokenBoxString);
  runApp(const CareerCraft());
}

class CareerCraft extends StatelessWidget {
  const CareerCraft({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        locale: Locale(langCode),
        title: 'Career Craft',
        theme: theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashView(),
      ),
    );
  }
}
