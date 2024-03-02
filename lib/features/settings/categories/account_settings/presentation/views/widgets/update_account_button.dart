import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAccountButton extends StatelessWidget {
  final void Function() onPressed;
  const UpdateAccountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpdateUserLoaded) {
          Navigator.pop(context);
          showErrorSnackbar(
              context: context,
              title: "success",
              body: "your Account has been Updated successfully !",
              icon: "assets/images/true.svg");
        } else if (state is UpdateUserError) {
          showErrorSnackbar(
              context: context, title: "Update Error", body: state.message);
        }
      },
      builder: (context, state) {
        if (state is UpdateUserLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).updateAccount,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
