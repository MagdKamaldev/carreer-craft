import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final JobsRepositoryImplementation jobRepositoryImplementation;
  JobsCubit(this.jobRepositoryImplementation) : super(JobsInitial());
  static JobsCubit get(context) => BlocProvider.of(context);

  Future<void> createJob(JobModel model) async {
    emit(CreateJobLoading());
    final response = await jobRepositoryImplementation.createJob(model);
    response.fold(
      (failure) => emit(CreateJobError(message: failure.message.toString())),
      (job) => emit(CreateJobLoaded(job: job)),
    );
  }

  Future<void> getAllJobs({int? pageNumber, int limit = 8}) async {
    if (pageNumber == 0) {
      emit(GetAllJobsLoading());
    } else {
      emit(GetAllJobsPaginationLoading());
    }
    final response = await jobRepositoryImplementation.getAllJobs(
        pageNumber: pageNumber!, limit: limit);
    response.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(GetAllJobsError(message: failure.message.toString()));
        } else {
          emit(
              GetAllJobsPaginationFailure(message: failure.message.toString()));
        }
      },
      (jobs) => emit(GetAllJobsLoaded(jobs: jobs)),
    );
  }

  Future<void> getCompanyJobs(String companyName) async {
    emit(GetCompanyJobsLoading());
    final response =
        await jobRepositoryImplementation.getCompanyJobs(companyName);
    response.fold(
      (failure) => emit(GetCompanyJobsError(message: failure.message.toString())),
      (jobs) => emit(GetCompanyJobsLoaded(jobs: jobs)),
    );
  }

  // Future<void> updateJob(JobModel model) async {
  //   emit(UpdateJobLoading());
  //   final response = await jobRepositoryImplementation.updateJob(model);
  //   response.fold(
  //     (failure) => emit(UpdateJobError(message: failure.message.toString())),
  //     (job) => emit(UpdateJobLoaded(job: job)),
  //   );
  // }

  Future<void> deleteJob(String id) async {
    final response = await jobRepositoryImplementation.deleteJob(id);
    response.fold(
      (failure) => emit(DeleteJobError(message: failure.message.toString())),
      (message) => emit(DeleteJobLoaded(message: message)),
    );
  }

}
