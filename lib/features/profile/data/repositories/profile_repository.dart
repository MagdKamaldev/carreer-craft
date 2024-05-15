import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getUser();

  Future<Either<Failure, UserModel>> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String dob,
  });

  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failure, String>> deleteUser();
}
