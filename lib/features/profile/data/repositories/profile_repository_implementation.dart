// ignore_for_file: deprecated_member_use

import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ApiServices apiServices;
  ProfileRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final response = await apiServices.get(
        endPoint: Endpoints.users,
        jwt: token,
      );
      UserModel user = UserModel.fromJson(response["user"]);
      //make the id in hive value this user id
      kIdBox.put(kIdBoxString, response["user"]["_id"]);
      return Right(user);
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dob,
  }) async {
    try {
      final response = await apiServices.put(
        endPoint: Endpoints.users,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "dob": dob,
        },
        jwt: token,
      );
      UserModel user = UserModel.fromJson(response["user"]);
      return Right(user);
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final response = await apiServices.put(
        endPoint: Endpoints.changePassword,
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
        jwt: token,
      );
      UserModel user = UserModel.fromJson(response["user"]);
      token = response["token"];
      kTokenBox.put(kTokenBoxString, token);
      return Right(user);
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser() async {
    try {
      await apiServices.delete(
        endPoint: Endpoints.users,
        jwt: token,
      );
      return const Right("User Deleted Successfuly");
    } on DioError catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
