import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/presentation/views/company_jobs_view.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/company_info_item.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyDetailsViewBody extends StatelessWidget {
  final String name;
  final CompanyModel company;
  const CompanyDetailsViewBody(
      {super.key, required this.name, required this.company});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: secondary[600]!,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: SvgPicture.asset(
                    "assets/images/company.svg",
                    height: size.height * 0.075,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Text(name, style: theme.headlineMedium),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(company.industry!,
                style: theme.bodyLarge!.copyWith(color: primary[600])),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(company.address!,
                style: theme.titleMedium!.copyWith(color: primary[700])),
            SizedBox(
              height: size.height * 0.025,
            ),
            Center(
              child: Text(company.description!, style: theme.bodyLarge),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: secondary,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(company.companyEmail!, style: theme.titleMedium),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: secondary,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            CompanyInfoItem(
                size: size,
                theme: theme,
                title: S.of(context).employees,
                value:
                    "${company.numberOfEmployees!.min.toString()} - ${company.numberOfEmployees!.max.toString()}",
                labelColor: secondary,
                valueColor: primary),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: defaultButton(
                  function: () {
                    navigateTo(context, CompanyJobsView(company: company));
                  },
                  context: context,
                  text: S.of(context).viewJobs,
                  height: size.height * 0.07),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
