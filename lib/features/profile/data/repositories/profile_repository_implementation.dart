import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

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
      return Right(user);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(
      {required String token,
      required String firsName,
      required String lastName,
      required String email,
      required String recoveryEmail,
      required String password,
      required String dob,
      required String mobileNumber}) async {
    try {
      final response = await apiServices.put(
        endPoint: Endpoints.users,
        data: {
          "firstName": firsName,
          "lastName": lastName,
          "email": email,
          "recoveryEmail": recoveryEmail,
          "password": password,
          "dob": dob,
          "mobileNumber": mobileNumber,
        },
        jwt: token,
      );
      UserModel user = UserModel.fromJson(response["user"]);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
