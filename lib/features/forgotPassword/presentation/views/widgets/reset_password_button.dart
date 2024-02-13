import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/forgotPassword/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButton extends StatelessWidget {
  final void Function() onPressed;
  const ResetPasswordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        if (state is ChangePasswordLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
              function: onPressed, context: context, text: "Reset Password");
        }
      },
    );
  }
}
