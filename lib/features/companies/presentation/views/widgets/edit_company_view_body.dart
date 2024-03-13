import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/edit_cmopany_item.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/edit_item.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class EditCompanyViewBody extends StatelessWidget {
  final CompanyModel company;
  const EditCompanyViewBody({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              editCompanyItem(size, theme, S.of(context).companyName, () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).companyName,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              editCompanyItem(size, theme, S.of(context).companyEmail, () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).companyEmail,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              editCompanyItem(size, theme, S.of(context).companyDescription,
                  () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).companyDescription,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              editCompanyItem(size, theme, S.of(context).industry, () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).industry,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              editCompanyItem(size, theme, S.of(context).adress, () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).adress,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              editCompanyItem(size, theme, S.of(context).employees, () {
                navigateTo(
                    context,
                    EditCompanyItem(
                      item: S.of(context).employees,
                      company: company,
                    ));
              }),
              SizedBox(
                height: size.height * 0.08,
              ),
              Text(
                S.of(context).creatingCompany,
                style: theme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              Text(
                S.of(context).terms,
                maxLines: 2,
                style: theme.bodyMedium!.copyWith(
                  color: secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
