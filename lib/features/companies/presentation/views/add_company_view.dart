import 'package:career_craft/features/companies/presentation/views/widgets/add_company_view_body.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/settings_app_bar.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddCompanyView extends StatelessWidget {
  const AddCompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).addCompany),
      body: const AddCompanyViewBody(),
    );
  }
}