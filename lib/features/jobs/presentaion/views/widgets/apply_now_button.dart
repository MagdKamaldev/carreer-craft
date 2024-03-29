import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyForJobJobButton extends StatelessWidget {
  final void Function() onPressed;
  const ApplyForJobJobButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {
        if (state is ApplicationSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          showErrorSnackbar(
              context: context,
              title: "Success",
              body: "Your job has been updated successfully!",
              icon: "assets/images/true.svg");
        } else if (state is UpdateJobError) {
          showErrorSnackbar(
              context: context, title: "Update Error", body: state.message);
        }
      },
      builder: (context, state) {
        if (state is ApplicationLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).applyNow,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
