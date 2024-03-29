// ignore_for_file: deprecated_member_use
import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/core/utils/end_points.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class JobsRepositoryImplementation extends JobsRepository {
  final ApiServices apiServices;
  JobsRepositoryImplementation({required this.apiServices});

  @override
  Future<Either<Failure, JobModel>> createJob(JobModel jobModel) async {
    try {
      final response = await apiServices.post(
        endPoint: Endpoints.jobs,
        data: {
          "jobTitle": jobModel.jobTitle,
          "jobLocation": jobModel.jobLocation,
          "workingTime": jobModel.workingTime,
          "seniortyLevel": jobModel.seniorityLevel,
          "jobDescription": jobModel.jobDescription,
          "technicalSkills": jobModel.technicalSkills,
          "softSkills": jobModel.softSkills,
        },
        jwt: token,
      );
      return Right(JobModel.fromJson(response["job"]));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteJob(String id) async{
    try{
      final response = await apiServices.delete(
        endPoint: "${Endpoints.jobs}/$id",
        jwt: token,
      );
      return Right(response.toString());
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
   
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllJobs(
      {int? pageNumber, int limit = 8}) async {
    try {
      final response = await apiServices.get(
        endPoint: "${Endpoints.jobs}?limit=$limit&page=$pageNumber",
        jwt: token,
      );
      final List<JobModel> jobs = [];
      for (var job in response["jobs"]) {
        jobs.add(JobModel.fromJson(job));
      }
      return Right(jobs);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JobModel>>> getCompanyJobs(String companyName) async{
    try{
      final response = await apiServices.get(
        endPoint: "${Endpoints.jobs}?company=$companyName",
        jwt: token,
      );
      final List<JobModel> jobs = [];
      for (var job in response["jobs"]) {
        jobs.add(JobModel.fromJson(job));
      }
      return Right(jobs);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    
    }
  }

  @override
  Future<Either<Failure, JobModel>> updateJob(JobModel jobModel) {
    // TODO: implement updateJob
    throw UnimplementedError();
  }
}
