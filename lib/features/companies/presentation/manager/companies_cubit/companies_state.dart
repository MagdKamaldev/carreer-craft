part of 'companies_cubit.dart';

sealed class CompaniesState {}

final class CompaniesInitial extends CompaniesState {}

class CreateCompanyLoading extends CompaniesState {}

class CreateCompanyLoaded extends CompaniesState {
  final CompanyModel company;
  CreateCompanyLoaded({required this.company});
}

class CreateCompanyError extends CompaniesState {
  final String message;
  CreateCompanyError({required this.message});
}

class GetAllCompaniesLoading extends CompaniesState {}

class GetAllCompaniesLoaded extends CompaniesState {
  final List<CompanyModel> companies;
  GetAllCompaniesLoaded({required this.companies});
}

class GetAllCompaniesError extends CompaniesState {
  final String message;
  GetAllCompaniesError({required this.message});
}

