// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/add_job_button.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/ingredients_list_widget.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_drop_down.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddJobViewBody extends StatelessWidget {
  const AddJobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    String jobLocation = "Onsite";
    String seniorityLevel = "Junior";
    String workingTime = "Full-Time";
    List<String>? softSkills = [];
    List<String>? technicalSkills = [];
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>()),
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) => SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                defaultTextField(
                    controller: titleController,
                    type: TextInputType.name,
                    label: S.of(context).jobTitle,
                    theme: theme,
                    context: context,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return S.of(context).emptyValidation;
                      }
                    }),
                SizedBox(
                  height: size.height * 0.04,
                ),
                defaultTextField(
                    controller: descriptionController,
                    type: TextInputType.multiline,
                    label: S.of(context).jobDescription,
                    theme: theme,
                    context: context,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return S.of(context).emptyValidation;
                      }
                    }),
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
                  ingredients: [],
                  onIngredientsChanged: (values) {
                    softSkills = values.cast<String>();
                  },
                  title: S.of(context).softSkills,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                IngredientListWidget(
                  ingredients: [],
                  onIngredientsChanged: (values) {
                    technicalSkills = values.cast<String>();
                  },
                  title: S.of(context).technicalSkills,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                AddJobButton(onPressed: () {
                  if (formKey.currentState!.validate() &&
                      technicalSkills!.isNotEmpty &&
                      softSkills!.isNotEmpty) {
                    JobsCubit.get(context).createJob(
                      JobModel(
                        jobTitle: titleController.text,
                        jobDescription: descriptionController.text,
                        jobLocation: jobLocation,
                        workingTime: workingTime,
                        technicalSkills: technicalSkills,
                        softSkills: softSkills,
                        seniorityLevel: seniorityLevel,
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  S.of(context).creatingJob,
                  style: theme.bodyMedium,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  S.of(context).terms,
                  maxLines: 2,
                  style: theme.bodyMedium!.copyWith(
                    color: secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
