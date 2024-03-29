import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/jobs_cubit/jobs_cubit.dart';

class UpdateJobButton extends StatelessWidget {
  final void Function() onPressed;
  const UpdateJobButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {
        if (state is UpdateJobLoaded) {
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
        if (state is UpdateJobLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).updateJob,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
