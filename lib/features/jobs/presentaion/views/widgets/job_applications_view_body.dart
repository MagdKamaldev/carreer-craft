import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/application_details_view.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobApplicationsViewBody extends StatelessWidget {
  final JobModel job;
  const JobApplicationsViewBody({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return BlocProvider(
        create: (context) => JobsCubit(
              getIt<JobsRepositoryImplementation>(),
            )..getApplicatedJobs(job.id!),
        child: BlocBuilder<JobsCubit, JobsState>(
            builder: (context, state) => state is GetApplicationsLoaded
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.75,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final application = state.applications[index];
                              return GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      ApplicationDetailsView(
                                          application: application));
                                },
                                child: SizedBox(
                                  width: size.width * 0.95,
                                  height: size.height * 0.13,
                                  child: Card(
                                      elevation: 2,
                                      color: primary.shade500,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${application.userId!.firstName} ${application.userId!.lastName}",
                                              style: theme.titleLarge,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              "  ${application.userId!.email}",
                                              style: theme.titleSmall!.copyWith(
                                                  color: Colors.white
                                                      .withOpacity(0.7)),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                            itemCount: state.applications.length,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        defaultButton(
                          function: () {
                            JobsCubit.get(context)
                                .generateExcellFile(job.id!, context);
                          },
                          context: context,
                          text: S.of(context).generateExcell,
                        )
                      ],
                    ))
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
