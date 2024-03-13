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

class GetCompanyByNameLoading extends CompaniesState {}

class GetCompanyByNameLoaded extends CompaniesState {
  final CompanyModel company;
  GetCompanyByNameLoaded({required this.company});
}

class GetCompanyByNameError extends CompaniesState {
  final String message;
  GetCompanyByNameError({required this.message});
}

class UpdateCompanyLoading extends CompaniesState {}

class UpdateCompanyLoaded extends CompaniesState {
  final CompanyModel company;
  UpdateCompanyLoaded({required this.company});
}

class UpdateCompanyError extends CompaniesState {
  final String message;
  UpdateCompanyError({required this.message});
}

class DeleteCompanyLoading extends CompaniesState {}

class DeleteCompanyLoaded extends CompaniesState {
  final String message;
  DeleteCompanyLoaded({required this.message});
}

class DeleteCompanyError extends CompaniesState {
  final String message;
  DeleteCompanyError({required this.message});
}

