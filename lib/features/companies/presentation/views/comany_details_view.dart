import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:career_craft/features/companies/presentation/manager/companies_cubit/companies_cubit.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/company_info_item.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/settings_app_bar.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsView extends StatelessWidget {
  final String name;
  const CompanyDetailsView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          CompaniesCubit(getIt<CompaniesRepositoryImplementation>())
            ..getCompanyByName(name),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          if (state is GetCompanyByNameLoading) {
            return Scaffold(
              appBar: settingsAppBar(context, S.of(context).companyName),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is GetCompanyByNameLoaded) {
            return Scaffold(
              appBar: settingsAppBar(context, state.company.companyName!),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CompanyInfoItem(
                        label: S.of(context).companyDescription,
                        size: size,
                        theme: theme,
                        value: state.company.description!,
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CompanyInfoItem(
                        label: S.of(context).industry,
                        size: size,
                        theme: theme,
                        value: state.company.industry!,
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CompanyInfoItem(
                        label: S.of(context).adress,
                        size: size,
                        theme: theme,
                        value: state.company.address!,
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CompanyInfoItem(
                        label: S.of(context).email,
                        size: size,
                        theme: theme,
                        value: state.company.companyEmail!,
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CompanyInfoItem(
                        label: S.of(context).minimumEmployees,
                        size: size,
                        theme: theme,
                        value: state.company.numberOfEmployees!.min.toString(),
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CompanyInfoItem(
                        label: S.of(context).maximumEmployees,
                        size: size,
                        theme: theme,
                        value: state.company.numberOfEmployees!.max.toString(),
                        labelColor: secondary,
                        valueColor: primary),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: defaultButton(
                          function: () {},
                          context: context,
                          text: "Jobs",
                          height: size.height * 0.07),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
