import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, CompanyModel>> createCompany({
    required String companyName,
    required String companyDescription,
    required String industry,
    required String adress,
    required int minNumberOfEmployees,
    required int maxNumberOfEmployees,
    required String companyEmail,
  });

  Future<Either<Failure, CompanyModel>> getCompanyByName();

  Future<Either<Failure, CompanyModel>> updateCompany({
    required String companyName,
    required String companyDescription,
    required String industry,
    required String adress,
    required int minNumberOfEmployees,
    required int maxNumberOfEmployees,
    required String companyEmail,
  });

  Future<Either<Failure, CompanyModel>> deleteCompany();


}
