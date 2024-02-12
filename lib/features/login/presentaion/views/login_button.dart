import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/login/presentaion/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;
  
  const LoginButton(
      {super.key,  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginSuccess) {
        GoRouter.of(context).pushReplacement(AppRouter.homeView);
      } else if (state is LoginFailure) {
        showErrorSnackbar(
            context: context, title: "LoginError", body: state.message);
      }
    }, builder: (context, state) {
      if (state is LoginLoading) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: secondary,
          ),
        );
      } else {
        return defaultButton(
        function: onPressed,
          context: context,
          text: "Sign in",
          height: size.height * 0.06,
        );
      }
    });
  }
}
