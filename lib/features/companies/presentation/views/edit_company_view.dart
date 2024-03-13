import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/edit_company_view_body.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditCompanyView extends StatelessWidget {
  final CompanyModel company;
  const EditCompanyView({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).editCompany),
      body: EditCompanyViewBody(
        company: company,
      ),
    );
  }
}
