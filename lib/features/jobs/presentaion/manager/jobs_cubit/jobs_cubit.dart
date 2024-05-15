// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/features/jobs/data/models/application_model.dart';
import 'package:career_craft/features/jobs/data/models/get_application_model/application_model.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/features/jobs/data/repositories/jobs_repository_impelemntation.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
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
      (failure) =>
          emit(GetCompanyJobsError(message: failure.message.toString())),
      (jobs) => emit(GetCompanyJobsLoaded(jobs: jobs)),
    );
  }

  Future<void> updateJob(JobModel model) async {
    emit(UpdateJobLoading());
    final response = await jobRepositoryImplementation.updateJob(model);
    response.fold(
      (failure) => emit(UpdateJobError(message: failure.message.toString())),
      (job) => emit(UpdateJobLoaded(job: job)),
    );
  }

  Future<void> deleteJob(String id) async {
    final response = await jobRepositoryImplementation.deleteJob(id);
    response.fold(
      (failure) => emit(DeleteJobError(message: failure.message.toString())),
      (message) => emit(DeleteJobLoaded(message: message)),
    );
  }

  File? file;

  void pickFile(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      emit(PickFileLoaded(file: file!));
    } else {
      emit(PickFileError(message: "File not picked !"));
      showErrorSnackbar(
          context: context,
          title: S.of(context).error,
          body: S.of(context).fileNotPicked);
    }
  }

  void removeFile() {
    file = null;
    emit(RemoveFile());
  }

  List<String> technicalSkills = [];
  List<String> softSkills = [];

  Future<void> applyForJob(var pickedFile, JobModel job, context) async {
    emit(ApplicationLoading());
    final response = await jobRepositoryImplementation.applyForJob(
        pickedFile, technicalSkills, softSkills, job);
    response.fold(
      (failure) {
        emit(ApplicationError(message: failure.message.toString()));
        showErrorSnackbar(
            context: context,
            title: S.of(context).error,
            body: failure.message.toString());
      },
      (application) {
        emit(ApplicationSuccess(application: application));
        showErrorSnackbar(
            context: context,
            title: S.of(context).success,
            body: S.of(context).applicationSent);
      },
    );
  }

  Future<void> getApplicatedJobs(String id) async {
    emit(GetApplicationsLoading());
    final response = await jobRepositoryImplementation.getApplicatedJobs(id);
    response.fold(
      (failure) =>
          emit(GetApplicationsError(message: failure.message.toString())),
      (applications) => emit(GetApplicationsLoaded(applications: applications)),
    );
  }

  Future<void> generateExcellFile(String id,context) async {
    emit(GenerateExcellFileLoading());
    final response = await jobRepositoryImplementation.generateExcellFile(id);
    response.fold(
      (failure) =>
          emit(GenerateExcellFileError(message: failure.message.toString())),
      (path) {
        emit(GenerateExcellFileLoaded(message: path));
        openExcelSheet(path,context);
      },
    );
  }

  void openExcelSheet(String path, BuildContext context) async {
    try {
      if (path != "") {
        await OpenFile.open(path);
      } else {
        showErrorSnackbar(context: context, title: "Path Error", body: "Error in Generating path");
      }
    } catch (error) {
      showErrorSnackbar(context: context, title: "Error", body: error.toString());
      }
    }
  }

