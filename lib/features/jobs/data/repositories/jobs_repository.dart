import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/features/jobs/data/models/application_model.dart';
import 'package:career_craft/features/jobs/data/models/get_application_model/application_model.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:dartz/dartz.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<JobModel>>> getAllJobs(
      {int pageNumber, int limit});
  Future<Either<Failure, List<JobModel>>> getCompanyJobs(String companyName);
  Future<Either<Failure, JobModel>> createJob(JobModel jobModel);
  Future<Either<Failure, JobModel>> updateJob(JobModel jobModel);
  Future<Either<Failure, String>> deleteJob(String id);
  Future<Either<Failure, ApplicationModel>> applyForJob(var pickedFile,
      List<String> technicalSkills, List<String> softSkills, JobModel job);
  Future<Either<Failure, List<GetApplicationModel>>> getApplicatedJobs(
      String id);
  Future<Either<Failure,dynamic>> generateExcellFile(String id);
}
