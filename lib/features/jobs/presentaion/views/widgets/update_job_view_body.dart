import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/ingredients_list_widget.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_drop_down.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/update_job_button.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateJobViewBody extends StatelessWidget {
  final JobModel job;
  const UpdateJobViewBody({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? jobLocation = job.jobLocation;
    String? workingTime = job.workingTime;
    String? seniorityLevel = job.seniorityLevel;
    List<dynamic>? technicalSkills = job.technicalSkills;
    List<String>? softSkills = job.softSkills;
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>()),
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                child: JobsDropDown(
                    dropList: [
                      S.of(context).junior,
                      S.of(context).midLevel,
                      S.of(context).senior,
                      S.of(context).cto,
                    ],
                    title: S.of(context).seniorityLevel,
                    onSelected: (String value) {
                      seniorityLevel = value;
                    }),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  JobsDropDown(
                      dropList: [
                        S.of(context).fullTime,
                        S.of(context).partTime,
                      ],
                      title: S.of(context).workingTime,
                      onSelected: (String value) {
                        workingTime = value;
                      }),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  JobsDropDown(
                      dropList: [
                        S.of(context).onsite,
                        S.of(context).remotely,
                        S.of(context).hybrid,
                      ],
                      title: S.of(context).jobLocation,
                      onSelected: (String value) {
                        jobLocation = value;
                      }),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              IngredientListWidget(
                ingredients: job.softSkills!,
                onIngredientsChanged: (values) {
                  softSkills = values.cast<String>();
                },
                title: S.of(context).softSkills,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              IngredientListWidget(
                ingredients: job.technicalSkills!,
                onIngredientsChanged: (values) {
                  job.technicalSkills = values.cast<String>();
                },
                title: S.of(context).technicalSkills,
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              UpdateJobButton(onPressed: () {
                JobModel job2 = JobModel(
                  id: job.id,
                  jobTitle: job.jobTitle,
                  jobDescription: job.jobDescription,
                  jobLocation: jobLocation,
                  workingTime: workingTime,
                  seniorityLevel: seniorityLevel,
                  technicalSkills: technicalSkills,
                  softSkills: softSkills,
                  addedBy: job.addedBy,
                );
                context.read<JobsCubit>().updateJob(job2);
              }),
              SizedBox(
                height: size.height * 0.04,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
