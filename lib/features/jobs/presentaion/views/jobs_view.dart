import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/all_jobs_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>())
        ..getAllJobs(pageNumber: 0),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSearchBar(),
              SizedBox(height: size.height * 0.02),
              Container(
                width: double.infinity,
                height: 0.5,
                color: primary,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                S.of(context).jobs,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                  height: size.height * 0.56, child: const AllJobListView()),
            ],
          ),
        ),
      ),
    );
  }
}
