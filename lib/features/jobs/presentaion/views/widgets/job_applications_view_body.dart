import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobApplicationsViewBody extends StatelessWidget {
  final JobModel job;
  const JobApplicationsViewBody({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => JobsCubit(
              getIt<JobsRepositoryImplementation>(),
            )..getApplicatedJobs(job.id!),
        child: BlocBuilder<JobsCubit, JobsState>(
            builder: (context, state) => state is GetApplicationsLoaded
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final application = state.applications[index];
                        return SizedBox(
                          width: size.width * 0.95,
                          height: size.height * 0.13,
                          child: Card(
                              elevation: 2,
                              color: primary.shade500,
                              child: Text(application.userId!.firstName!)),
                        );
                      },
                      itemCount: state.applications.length,
                    ))
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
