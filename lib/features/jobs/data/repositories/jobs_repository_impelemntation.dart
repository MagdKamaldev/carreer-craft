import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/api_services.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository.dart';
import 'package:dartz/dartz.dart';

class JobsRepositoryImplementation extends JobsRepository {
  final ApiServices apiServices;
  JobsRepositoryImplementation({required this.apiServices});


  @override
  Future<Either<Failure, JobModel>> createJob(JobModel jobModel) {
    // TODO: implement createJob
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JobModel>> deleteJob(String id) {
    // TODO: implement deleteJob
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllJobs() {
    // TODO: implement getAllJobs
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<JobModel>>> getCompanyJobs() {
    // TODO: implement getCompanyJobs
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JobModel>> updateJob(JobModel jobModel) {
    // TODO: implement updateJob
    throw UnimplementedError();
  }
}