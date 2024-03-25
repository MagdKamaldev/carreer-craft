import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:career_craft/features/jobs/presentaion/views/job_details_view.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_item.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_loading_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllJobListView extends StatefulWidget {
  const AllJobListView({super.key});

  @override
  State<AllJobListView> createState() => _AllJobListViewState();
}

class _AllJobListViewState extends State<AllJobListView> {
  late final ScrollController _scrollController;
  List<JobModel> jobs = [];
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    isLoading = false;
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= maxScrollLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<JobsCubit>(context)
            .getAllJobs(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {
        if (state is GetAllJobsLoaded) {
          final newJobs = state.jobs
              .where(
                  (job) => !jobs.any((existingJob) => existingJob.id == job.id))
              .toList();
          jobs.addAll(newJobs);
        }
      },
      builder: (context, state) {
        if (state is GetAllJobsLoading && jobs.isEmpty) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const JobLoadingItem(),
                  SizedBox(height: size.height * 0.02),
                ],
              );
            },
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: state is GetAllJobsPaginationLoading
                      ? jobs.length + 2
                      : jobs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= jobs.length &&
                        state is GetAllJobsPaginationLoading) {
                      return Column(
                        children: [
                          const JobLoadingItem(),
                          SizedBox(height: size.height * 0.02),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          navigateTo(context, JobDetailsView(job: jobs[index]));
                          print(jobs[index].id);
                        },
                        child: Column(
                          children: [
                            JobItem(job: jobs[index]),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
