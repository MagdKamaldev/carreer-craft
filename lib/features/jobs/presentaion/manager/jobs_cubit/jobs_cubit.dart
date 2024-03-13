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
}

class JobRepositoryImplementation {}
