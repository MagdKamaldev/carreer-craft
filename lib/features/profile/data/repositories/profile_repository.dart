import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure,UserModel>> getUser();
  Future<Either<Failure, UserModel>> updateProfile({
    required String token,
    required String firsName,
    required String lastName,
    required String email,
    required String recoveryEmail,
    required String password,
    required String dob,
    required String mobileNumber,
  });
}
