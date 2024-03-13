import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/add_job_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).addJob),
      body: const AddJobViewBody(),
    );
  }
}
