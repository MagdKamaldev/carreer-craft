import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_applications_view_body.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class JobApplicationsView extends StatelessWidget {
  final JobModel job;
  const JobApplicationsView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).applications),
      body: JobApplicationsViewBody(
        job: job,
      ),
    );
  }
}
