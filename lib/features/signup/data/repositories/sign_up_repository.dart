import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/features/login/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<Failure, UserModel>> signUp(
      String firstName,
      String lastName,
      String email,
      String password,
      String dob,
      String mobileNumber,
      String role);
}
