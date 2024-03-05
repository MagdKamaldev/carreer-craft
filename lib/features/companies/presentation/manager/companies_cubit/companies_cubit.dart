import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepositoryImplementation companiesRepositoryImplementation;
  CompaniesCubit(this.companiesRepositoryImplementation)
      : super(CompaniesInitial());

  static CompaniesCubit get(context) => BlocProvider.of(context);

  Future<void> createCompany(
      {required String companyName,
      required String companyDescription,
      required String industry,
      required String adress,
      required String companyEmail,
      required int minNumberOfEmployees,
      required int maxNumberOfEmployees}) async {
    emit(CreateCompanyLoading());
    final response = await companiesRepositoryImplementation.createCompany(
        companyName: companyName,
        companyDescription: companyDescription,
        industry: industry,
        adress: adress,
        minNumberOfEmployees: minNumberOfEmployees,
        maxNumberOfEmployees: maxNumberOfEmployees,
        companyEmail: companyEmail);
    response.fold(
      (failure) =>
          emit(CreateCompanyError(message: failure.message.toString())),
      (company) => emit(CreateCompanyLoaded(company: company)),
    );
  }
}
