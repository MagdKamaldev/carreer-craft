import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/jobs/data/models/get_application_model/application_model.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/application_details_view_body.dart';
import 'package:flutter/material.dart';

class ApplicationDetailsView extends StatelessWidget {
  final GetApplicationModel application;
  const ApplicationDetailsView({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context,
          "${application.userId!.firstName} ${application.userId!.lastName}"),
      body: ApplicationDetailsViewBody(application: application),
    );
  }
}
