import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/news_api_service.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_repository_implementation.dart';
import 'package:career_craft/features/login/data/repositories/login_repository_implementation.dart';
import 'package:career_craft/features/news/data/repositories/news_repository_implementation.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:career_craft/features/signup/data/repositories/sign_up_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
      Dio(),
    ),
  );
  //news dio
  getIt.registerLazySingleton<NewsApiServices>(
    () => NewsApiServices(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<LoginRepositoryImplementation>(
    () => LoginRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<SignUpRepositoryImplementation>(
    () => SignUpRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<ForgotPasswordRepositoryImplementation>(
    () => ForgotPasswordRepositoryImplementation(
      apiServices: getIt<ApiServices>(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepositoryImplementation>(
    () => ProfileRepositoryImplementation(
     apiServices: getIt<ApiServices>(),
    ),
  );
  //news
  getIt.registerLazySingleton<NewsRepositoryImplementation>(
    () => NewsRepositoryImplementation(
      newsApiServices: getIt<NewsApiServices>(),
    ),
  );
  
}
