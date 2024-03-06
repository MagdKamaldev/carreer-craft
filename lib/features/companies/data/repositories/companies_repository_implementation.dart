// ignore_for_file: deprecated_member_use

import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:career_craft/features/companies/data/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';

class CompaniesRepositoryImplementation implements CompaniesRepository {
  final ApiServices apiServices;
  CompaniesRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, CompanyModel>> createCompany(
      {required String companyName,
      required String companyDescription,
      required String industry,
      required String adress,
      required int minNumberOfEmployees,
      required int maxNumberOfEmployees,
      required String companyEmail}) async {
    try {
      final response = await apiServices.post(
          endPoint: Endpoints.company,
          data: {
            "companyName": companyName,
            "description": companyDescription,
            "industry": industry,
            "address": adress,
            "numberOfEmployees": {
              "min": minNumberOfEmployees,
              "max": maxNumberOfEmployees
            },
            "companyEmail": companyEmail,
          },
          jwt: token);
      return Right(CompanyModel.fromJson(response["company"]));
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } on Exception catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> deleteCompany() async {
    try {
      final response =
          await apiServices.delete(endPoint: Endpoints.company, jwt: token);
      return Right(CompanyModel.fromJson(response));
    }  on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    }
    on Exception catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompanyByName() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CompanyModel>> updateCompany(
      {required String companyName,
      required String companyDescription,
      required String industry,
      required String adress,
      required int minNumberOfEmployees,
      required int maxNumberOfEmployees,
      required String companyEmail}) async {
    try {
      final response = await apiServices.put(
          endPoint: Endpoints.company,
          data: {
            "companyName": companyName,
            "description": companyDescription,
            "industry": industry,
            "address": adress,
            "numberOfEmployees": {
              "min": minNumberOfEmployees,
              "max": maxNumberOfEmployees
            },
            "companyEmail": companyEmail,
          },
          jwt: token);
      return Right(CompanyModel.fromJson(response["company"]));
    }on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    }
    on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
