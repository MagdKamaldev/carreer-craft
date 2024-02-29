// ignore_for_file: body_might_complete_normally_catch_error
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ProfileRepositoryImplementation profileRepositoryImplementation;
  UserCubit(this.profileRepositoryImplementation) : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  Future<void> getUser() async {
    emit(UserLoading());
    final response = await profileRepositoryImplementation.getUser();
    response.fold(
      (failure) => emit(UserError(message: failure.message.toString())),
      (user) => emit(UserLoaded(user: user)),
    );
  }

  Future<void> updateProfile({
    required String token,
    required String firsName,
    required String lastName,
    required String email,
    required String recoveryEmail,
    required String password,
    required String dob,
    required String mobileNumber,
  }) async {
    emit(UserLoading());
    final response = await profileRepositoryImplementation.updateProfile(
      token: token,
      firsName: firsName,
      lastName: lastName,
      email: email,
      recoveryEmail: recoveryEmail,
      password: password,
      dob: dob,
      mobileNumber: mobileNumber,
    );
    response.fold(
      (failure) => emit(UserError(message: failure.message.toString())),
      (user) => emit(UserLoaded(user: user)),
    );
  }
}
