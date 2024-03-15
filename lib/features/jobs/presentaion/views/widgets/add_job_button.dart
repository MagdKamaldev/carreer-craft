import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/jobs_cubit/jobs_cubit.dart';

class AddJobButton extends StatelessWidget {
  final void Function() onPressed;
  const AddJobButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {
        if (state is CreateJobLoaded) {
          Navigator.pop(context);
          showErrorSnackbar(
              context: context,
              title: "success",
              body: "your Company has been Added successfully !",
              icon: "assets/images/true.svg");
        } else if (state is CreateJobError) {
          showErrorSnackbar(
              context: context, title: "Creation Error", body: state.message);
        }
      },
      builder: (context, state) {
        if (state is CreateJobLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).createJob,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
