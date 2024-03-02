// ignore_for_file: deprecated_member_use

import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/signup/data/repositories/sign_up_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepositoryImplementation implements SignUpRepository {
  final ApiServices apiServices;

  SignUpRepositoryImplementation({
    required this.apiServices,
  });

  @override
  Future<Either<Failure, UserModel>> signUp(
      String firstName,
      String lastName,
      String email,
      String password,
      String bio,
      String dob,
      String mobileNumber,
      String role) async {
    try {
      final response = await apiServices.post(
        endPoint: Endpoints.signUp,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "DOB": dob,
          "bio": bio,
          "mobileNumber": mobileNumber,
          "role": role,
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
