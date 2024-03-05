import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/add_company_button.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/companies_cubit/companies_cubit.dart';

class AddCompanyViewBody extends StatelessWidget {
  const AddCompanyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController industryController = TextEditingController();
    TextEditingController adressController = TextEditingController();
    TextEditingController minEmployees = TextEditingController();
    TextEditingController maxEmployees = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) =>
          CompaniesCubit(getIt<CompaniesRepositoryImplementation>()),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) => SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.42,
                          child: defaultTextField(
                              controller: nameController,
                              type: TextInputType.name,
                              label: S.of(context).companyName,
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
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: S.of(context).companyEmail,
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
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: descriptionController,
                      type: TextInputType.multiline,
                      label: S.of(context).companyDescription,
                      theme: theme,
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return S.of(context).emptyValidation;
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: industryController,
                      type: TextInputType.name,
                      label: S.of(context).industry,
                      theme: theme,
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return S.of(context).emptyValidation;
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: adressController,
                      type: TextInputType.emailAddress,
                      label: S.of(context).adress,
                      theme: theme,
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return S.of(context).emptyValidation;
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
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
                    height: size.height * 0.07,
                  ),
                  AddCompanyButton(onPressed: () {
                    if (formKey.currentState!.validate()) {
                      CompaniesCubit.get(context).createCompany(
                          companyName: nameController.text,
                          companyDescription: descriptionController.text,
                          industry: industryController.text,
                          adress: adressController.text,
                          companyEmail: emailController.text,
                          minNumberOfEmployees: int.parse(minEmployees.text),
                          maxNumberOfEmployees: int.parse(maxEmployees.text));
                    }
                  }),
                  SizedBox(
                    height: size.height * 0.12,
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
        ),
      ),
    );
  }
}
