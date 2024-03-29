// ignore_for_file: deprecated_member_use
import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/ingredients_list_widget.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationView extends StatelessWidget {
  final JobModel job;
  const ApplicationView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>()),
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) => Scaffold(
          appBar: companyAppBar(context, S.of(context).application, []),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Column(
                children: [
                  IngredientListWidget(
                    ingredients: [],
                    onIngredientsChanged: (values) {
                      //softSkills = values.cast<String>();
                    },
                    title: S.of(context).softSkills,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  IngredientListWidget(
                    ingredients: [],
                    onIngredientsChanged: (values) {
                      // technicalSkills = values.cast<String>();
                    },
                    title: S.of(context).technicalSkills,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  if (JobsCubit.get(context).file == null)
                    GestureDetector(
                      onTap: () {
                        JobsCubit.get(context).pickFile(context);
                      },
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                height: size.height * 0.15,
                                child: SvgPicture.asset(
                                  "assets/images/upload.svg",
                                  color: primary.shade200,
                                ),
                              ),
                              Text(S.of(context).uploadResume,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: primary.shade200)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (JobsCubit.get(context).file != null)
                    Container(
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.15,
                              child: SvgPicture.asset(
                                "assets/images/true.svg",
                                color: primary.shade200,
                              ),
                            ),
                            Text(S.of(context).uploaded,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: primary.shade200)),
                          ],
                        ),
                      ),
                    ),
                  if (JobsCubit.get(context).file != null)
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  if (JobsCubit.get(context).file != null)
                    GestureDetector(
                      onTap: () {
                        JobsCubit.get(context).removeFile();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).cancel,
                            style: theme.titleLarge,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          SvgPicture.asset(
                            "assets/images/cancel.svg",
                            color: primary,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
