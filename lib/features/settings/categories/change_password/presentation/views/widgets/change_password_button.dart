import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordButton extends StatelessWidget {
  final void Function() onPressed;
  const ChangePasswordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
              function: onPressed,
              context: context,
              text: S.of(context).changePassword);
        }
      },
    );
  }
}