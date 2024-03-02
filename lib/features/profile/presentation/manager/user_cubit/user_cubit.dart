// ignore_for_file: body_might_complete_normally_catch_error
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:flutter/material.dart';
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
    required String firstName,
    required String lastName,
    required String email,
    required String recoveryEmail,
    required String password,
    required String dob,
    required String bio,
  }) async {
    emit(UserLoading());
    final response = await profileRepositoryImplementation.updateProfile(
      token: token,
      firstName: firstName,
      lastName: lastName,
      bio: bio,
      email: email,
      recoveryEmail: recoveryEmail,
      password: password,
      dob: dob,
    );
    response.fold(
      (failure) => emit(UpdateUserError(message: failure.message.toString())),
      (user) => emit(UpdateUserLoaded(user: user)),
    );
  }

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String? selectedValue;
  void changeSelectedValue(String value) {
    selectedValue = value;
    emit(SelectValueState());
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      dayController.text = picked.day.toString();
      monthController.text = picked.month.toString();
      yearController.text = picked.year.toString();
      emit(SelectDateState());
    }
  }

  IconData passwordSuffix = Icons.visibility_outlined;
  bool passwordIsPassword = true;

  void changePassword() {
    passwordIsPassword = !passwordIsPassword;
    passwordSuffix = passwordIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  IconData confirmSuffix = Icons.visibility_outlined;
  bool confirmIsPassword = true;

  void changeConfirm() {
    confirmIsPassword = !confirmIsPassword;
    confirmSuffix = confirmIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
