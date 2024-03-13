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
