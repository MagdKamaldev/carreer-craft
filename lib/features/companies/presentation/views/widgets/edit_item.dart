// ignore_for_file: must_be_immutable
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:career_craft/features/companies/presentation/manager/companies_cubit/companies_cubit.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/update_company_button.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCompanyItem extends StatelessWidget {
  final String item;
  final CompanyModel company;
  final TextEditingController itemController = TextEditingController();
  final TextEditingController maxEmployees = TextEditingController();
  final TextEditingController minEmployees = TextEditingController();
  var formKey = GlobalKey<FormState>();
  EditCompanyItem({super.key, required this.item, required this.company});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          CompaniesCubit(getIt<CompaniesRepositoryImplementation>()),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) => Scaffold(
          appBar: settingsAppBar(context, S.of(context).editCompany),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      item,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    if (item != S.of(context).employees)
                      defaultTextField(
                          controller: itemController,
                          type: TextInputType.name,
                          label: item,
                          theme: theme,
                          context: context,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return S.of(context).emptyValidation;
                            }
                          }),
                    if (item == S.of(context).employees)
                      SizedBox(
                        width: size.width * 0.9,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.42,
                              child: defaultTextField(
                                  controller: minEmployees,
                                  type: TextInputType.number,
                                  label: S.of(context).minimumEmployees,
                                  theme: theme,
                                  context: context,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return S.of(context).emptyValidation;
                                    }
                                  }),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            SizedBox(
                              width: size.width * 0.42,
                              child: defaultTextField(
                                  controller: maxEmployees,
                                  type: TextInputType.number,
                                  label: S.of(context).maximumEmployees,
                                  theme: theme,
                                  context: context,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return S.of(context).emptyValidation;
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    UpdateCompanyButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        editCompanyFunction(
                            context: context,
                            item: item,
                            company: company,
                            value: itemController.text,
                            minValue: minEmployees.text,
                            maxValue: maxEmployees.text);
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void editCompanyFunction({
    required BuildContext context,
    required String item,
    required CompanyModel company,
    String? value,
    String? minValue,
    String? maxValue,
  }) {
    if (item == S.of(context).companyName) {
      CompaniesCubit.get(context).updateCompany(
          companyName: value!,
          companyDescription: company.description!,
          industry: company.industry!,
          adress: company.address!,
          companyEmail: company.companyEmail!,
          minNumberOfEmployees: company.numberOfEmployees!.min!,
          maxNumberOfEmployees: company.numberOfEmployees!.max!);
    } else if (item == S.of(context).companyEmail) {
      CompaniesCubit.get(context).updateCompany(
          companyName: company.companyName!,
          companyDescription: company.description!,
          industry: company.industry!,
          adress: company.address!,
          companyEmail: value!,
          minNumberOfEmployees: company.numberOfEmployees!.min!,
          maxNumberOfEmployees: company.numberOfEmployees!.max!);
    } else if (item == S.of(context).companyDescription) {
      CompaniesCubit.get(context).updateCompany(
          companyName: company.companyName!,
          companyDescription: value!,
          industry: company.industry!,
          adress: company.address!,
          companyEmail: company.companyEmail!,
          minNumberOfEmployees: company.numberOfEmployees!.min!,
          maxNumberOfEmployees: company.numberOfEmployees!.max!);
    } else if (item == S.of(context).industry) {
      CompaniesCubit.get(context).updateCompany(
          companyName: company.companyName!,
          companyDescription: company.description!,
          industry: value!,
          adress: company.address!,
          companyEmail: company.companyEmail!,
          minNumberOfEmployees: company.numberOfEmployees!.min!,
          maxNumberOfEmployees: company.numberOfEmployees!.max!);
    } else if (item == S.of(context).adress) {
      CompaniesCubit.get(context).updateCompany(
          companyName: company.companyName!,
          companyDescription: company.description!,
          industry: company.industry!,
          adress: value!,
          companyEmail: company.companyEmail!,
          minNumberOfEmployees: company.numberOfEmployees!.min!,
          maxNumberOfEmployees: company.numberOfEmployees!.max!);
    } else if (item == S.of(context).employees) {
      CompaniesCubit.get(context).updateCompany(
          companyName: company.companyName!,
          companyDescription: company.description!,
          industry: company.industry!,
          adress: company.address!,
          companyEmail: company.companyEmail!,
          minNumberOfEmployees: int.parse(minValue!),
          maxNumberOfEmployees: int.parse(maxValue!));
    }
  }
}
