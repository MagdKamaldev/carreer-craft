part of 'jobs_cubit.dart';

abstract class JobsState {}

final class JobsInitial extends JobsState {}

class CreateJobLoading extends JobsState {}

class CreateJobLoaded extends JobsState {
  final JobModel job;
  CreateJobLoaded({required this.job});
}

class CreateJobError extends JobsState {
  final String message;
  CreateJobError({required this.message});
}

class GetAllJobsLoading extends JobsState {}

class GetAllJobsPaginationLoading extends JobsState {}

class GetAllJobsPaginationFailure extends JobsState {
  final String message;
  GetAllJobsPaginationFailure({required this.message});
}

class GetAllJobsLoaded extends JobsState {
  final List<JobModel> jobs;
  GetAllJobsLoaded({required this.jobs});
}

class GetAllJobsError extends JobsState {
  final String message;
  GetAllJobsError({required this.message});
}

class GetCompanyJobsLoading extends JobsState {}

class GetCompanyJobsLoaded extends JobsState {
  final List<JobModel> jobs;
  GetCompanyJobsLoaded({required this.jobs});
}

class GetCompanyJobsError extends JobsState {
  final String message;
  GetCompanyJobsError({required this.message});
}

class UpdateJobLoading extends JobsState {}

class UpdateJobLoaded extends JobsState {
  final JobModel job;
  UpdateJobLoaded({required this.job});
}

class UpdateJobError extends JobsState {
  final String message;
  UpdateJobError({required this.message});
}

class DeleteJobLoading extends JobsState {}

class DeleteJobLoaded extends JobsState {
  final String message;
  DeleteJobLoaded({required this.message});
}

class DeleteJobError extends JobsState {
  final String message;
  DeleteJobError({required this.message});
}



