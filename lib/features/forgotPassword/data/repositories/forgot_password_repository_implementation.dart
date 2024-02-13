// ignore_for_file: deprecated_member_use

import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_reposiotry.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgotPasswordRepositoryImplementation
    implements ForgotPasswordRepository {
  late final ApiServices apiServices;

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    try {
      final response = await apiServices.post(
        endPoint: Endpoints.forgotPassword,
        data: {
          "email": email,
        },
      );
      return Right(response["message"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> sendResetCode(String code) async {
    try {
      final response = await apiServices.post(
        endPoint: Endpoints.resetCode,
        data: {
          "resetCode": code,
        },
      );
      return Right(response["status"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      String email, String password, String confirmPassword) async {
    try {
      final response = await apiServices.put(
        endPoint: Endpoints.resetPassword,
        data: {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      token = response["token"];
      return Right(response["token"]);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
