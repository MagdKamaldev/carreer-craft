import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/home/presentation/views/home_view.dart';
import 'package:career_craft/features/signup/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpButton extends StatelessWidget {
  final void Function() onPressed;
  const SignUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          navigateAndFinish(context, const HomeView());
        } else if (state is SignUpFailure) {
          showErrorSnackbar(
              context: context, title: "Sign Up Error", body: state.message);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).createAccount,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
