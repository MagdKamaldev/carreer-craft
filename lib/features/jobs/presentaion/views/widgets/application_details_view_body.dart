import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/jobs/data/models/get_application_model/application_model.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/skill_list.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ApplicationDetailsViewBody extends StatelessWidget {
  final GetApplicationModel application;
  const ApplicationDetailsViewBody({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User information card
            Text(
              S.of(context).aboutInfo,
              style: theme.titleLarge,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                color: primary.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${application.userId!.firstName} ${application.userId!.lastName}",
                        style: theme.titleMedium,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        application.userId!.email!,
                        style:
                            theme.titleSmall!.copyWith(color: Colors.grey[300]),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        application.userId!.mobileNumber!,
                        style: theme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              S.of(context).skills,
              style: theme.titleLarge,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Skills section
            Card(
              elevation: 2,
              color: primary.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).technicalSkills} :",
                      style: theme.titleMedium,
                    ),
                    SizedBox(height: size.height * 0.02),
                    SkillsList(
                      skills: application.userTechSkills!,
                      theme: theme,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "${S.of(context).softSkills} :",
                      style: theme.titleMedium,
                    ),
                    SizedBox(height: size.height * 0.02),
                    SkillsList(
                      skills: application.userSoftSkills!,
                      theme: theme,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "${S.of(context).resume} :",
              style: theme.titleMedium,
            ),
            SizedBox(height: size.height * 0.02),
            // Resume section
            Card(
              elevation: 2,
              color: primary.shade500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child: SfPdfViewer.network(
                        application.userResume!,
                        canShowPaginationDialog: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
