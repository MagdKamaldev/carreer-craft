import 'package:career_craft/features/jobs/data/models/get_application_model/application_model.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                      "${application.userId!.firstName} ${application.userId!.lastName}",
                      style: theme.headlineSmall),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    application.userId!.email!,
                    style: theme.titleSmall!.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    application.userId!.mobileNumber!,
                    style: theme.bodyLarge,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${S.of(context).technicalSkills} :",
                    style: theme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height *
                        0.05 *
                        application.userTechSkills!.length.toDouble(),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: size.height * 0.01,
                      ),
                      itemCount: application.userTechSkills!.length,
                      itemBuilder: (context, index) => Text(
                        application.userTechSkills![index],
                        style: theme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  Text(
                    "${S.of(context).softSkills} :",
                    style: theme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height *
                        0.05 *
                        application.userSoftSkills!.length.toDouble(),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: size.height * 0.01,
                      ),
                      itemCount: application.userSoftSkills!.length,
                      itemBuilder: (context, index) => Text(
                        application.userSoftSkills![index],
                        style: theme.titleSmall!.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${S.of(context).resume} :",
                    style: theme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    child: SfPdfViewer.network(
                      application.userResume!,
                      canShowPaginationDialog: true,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
