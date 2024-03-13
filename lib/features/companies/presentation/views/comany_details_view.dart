import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:career_craft/features/companies/presentation/manager/companies_cubit/companies_cubit.dart';
import 'package:career_craft/features/companies/presentation/views/edit_company_view.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/company_details_view_body.dart';
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsView extends StatelessWidget {
  final String name;
  const CompanyDetailsView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompaniesCubit(getIt<CompaniesRepositoryImplementation>())
            ..getCompanyByName(name),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          if (state is GetCompanyByNameLoading) {
            return Scaffold(
              appBar: companyAppBar(context, S.of(context).companyName, []),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is GetCompanyByNameLoaded) {
            return Scaffold(
              appBar: companyAppBar(
                  context,
                  state.company.companyName!,
                  state.company.companyHr == kIdBox.get(kIdBoxString)
                      ? [
                          IconButton(
                              onPressed: () {
                                navigateTo(
                                    context,
                                    EditCompanyView(
                                      company: state.company,
                                    ));
                              },
                              icon: const Icon(
                                Icons.edit,
                              ))
                        ]
                      : []),
              body: CompanyDetailsViewBody(
                name: state.company.companyName!,
                company: state.company,
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
