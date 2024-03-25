import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/alert.dart';
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_details_view_body.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsView extends StatelessWidget {
  final JobModel job;
  const JobDetailsView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>()),
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) => Scaffold(
          appBar: companyAppBar(
              context,
              "${job.seniorityLevel} ${job.jobTitle!}",
              job.addedBy == kIdBox.get(kIdBoxString)
                  ? [
                      IconButton(
                          onPressed: () {
                            // navigateTo(
                            //     context,
                            //     EditCompanyView(
                            //       company: state.company,
                            //     ));
                          },
                          icon: const Icon(
                            Icons.edit,
                          )),
                      IconButton(
                          onPressed: () {
                            showappDialog(context, () {
                              JobsCubit.get(context).deleteJob(job.id!);
                              Navigator.pop(context);
                            }, S.of(context).deleteJob, S.of(context).deleteJob,
                                Theme.of(context).textTheme);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ]
                  : []),
          body: JobDetailsViewBody(job: job),
        ),
      ),
    );
  }
}
