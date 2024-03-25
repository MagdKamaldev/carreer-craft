import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/features/jobs/presentaion/views/job_details_view.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_loading_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import '../../../../jobs/presentaion/views/widgets/job_item.dart';

class CompanyJobsViewBody extends StatelessWidget {
  final CompanyModel company;
  const CompanyJobsViewBody({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => JobsCubit(getIt<JobsRepositoryImplementation>())
        ..getCompanyJobs(company.companyName!),
      child: BlocBuilder<JobsCubit, JobsState>(
        builder: (context, state) {
          if (state is GetCompanyJobsLoading) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    const JobLoadingItem(),
                    SizedBox(height: size.height * 0.02),
                  ],
                );
              },
            );
          } else if (state is GetCompanyJobsLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.jobs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          navigateTo(
                              context, JobDetailsView(job: state.jobs[index]));
                        },
                        child: Column(
                          children: [
                            JobItem(job: state.jobs[index]),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is GetCompanyJobsError) {
            return Text(state.message);
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}
