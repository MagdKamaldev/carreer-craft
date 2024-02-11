import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/features/login/data/models/user_model.dart';
import 'package:career_craft/features/login/data/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImplementation implements LoginRepository {
  @override
  Future<Either<Failure, UserModel>> login(String email, String password) {
    
    throw UnimplementedError();
  }
  
}