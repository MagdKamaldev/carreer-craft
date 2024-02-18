// ignore_for_file: deprecated_member_use
import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/login/data/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final ApiServices apiServices;
  LoginRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final response = await apiServices.post(
        endPoint: Endpoints.login,
        data: {
          "username": email,
          "password": password,
        },
      );
      token = response["token"];
      kTokenBox.put(kTokenBoxString, token);
      return Right(UserModel.fromJson(response["user"]));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
