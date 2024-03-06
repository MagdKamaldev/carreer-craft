import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:career_craft/features/companies/presentation/manager/companies_cubit/companies_cubit.dart';
import 'package:career_craft/features/companies/presentation/views/comany_details_view.dart';
import 'package:career_craft/features/companies/presentation/views/widgets/company_item.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          CompaniesCubit(getIt<CompaniesRepositoryImplementation>())
            ..getAllCompanies(),
      child: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          if (state is GetAllCompaniesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllCompaniesLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).companies,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.companies.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: size.height * 0.02);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            navigateTo(context, CompanyDetailsView(name: state.companies[index].companyName!,));
                          },
                          child: CompanyItem(
                            company: state.companies[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
