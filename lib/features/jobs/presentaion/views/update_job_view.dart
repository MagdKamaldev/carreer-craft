import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/update_job_view_body.dart';
import 'package:flutter/material.dart';

class UpdateJobView extends StatelessWidget {
  final JobModel job;
  const UpdateJobView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: companyAppBar(context, job.jobTitle!, []),
      body: UpdateJobViewBody(job: job),
    );
  }
}
