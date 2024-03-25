import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/company_jobs_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_bars.dart';
import '../../../../generated/l10n.dart';

class CompanyJobsView extends StatelessWidget {
  final CompanyModel company;
  const CompanyJobsView({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: companyAppBar(
          context, "${company.companyName} ${S.of(context).jobs} ", []),
      body: CompanyJobsViewBody(company: company),
    );
  }
}
