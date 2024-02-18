import 'package:career_craft/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, String>> sendPasswordResetEmail(String email);
  Future<Either<Failure, String>> sendResetCode(String code);
  Future<Either<Failure, String>> changePassword(
      String email, String password, String confirmPassword);
}
