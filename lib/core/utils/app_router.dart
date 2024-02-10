import 'package:career_craft/features/forgotPassword/presentation/views/forgot_password_view.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/reset_code_view.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/reset_password_view.dart';
import 'package:career_craft/features/home/presentation/views/home_view.dart';
import 'package:career_craft/features/onBoarding/presentation/views/on_borading_view.dart';
import 'package:career_craft/features/entrance/presentation/views/entrance_view.dart';
import 'package:career_craft/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingView = '/onboarding';
  static const entranceView = '/entrance/login';
  static const forgotPasswordView = "/forgotPassword";
  static const resetCodeView = "/resetCode";
  static const resetPasswordView = "/resetPassword";
  static const homeView = "/home";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => const OnBoradingView(),
      ),
      GoRoute(
        path: entranceView,
        builder: (context, state) => const EntranceView(),
      ),
      GoRoute(
        path: forgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: resetCodeView,
        builder: (context, state) => const ResetCodeView(),
      ),
      GoRoute(
        path: resetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
