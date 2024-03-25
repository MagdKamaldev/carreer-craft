import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_details_view_body.dart';
import 'package:flutter/material.dart';

class JobDetailsView extends StatelessWidget {
  final JobModel job;
  const JobDetailsView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: companyAppBar(
          context, "${job.seniorityLevel} ${job.jobTitle!}", null),
      body: JobDetailsViewBody(job: job),
    );
  }
}
