import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/signup/data/repositories/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;
  SignUpCubit(this.signUpRepository) : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String dob,
      required String mobileNumber,
      required String role}) async {
    emit(SignUpLoading());
    var result = await signUpRepository.signUp(
        firstName, lastName, email, password, dob, mobileNumber, role);
    result.fold((failure) {
      emit(SignUpFailure(failure.message));
    }, (user) {
      emit(SignUpSuccess(user));
    });
  }

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String? selectedValue;
  void changeSelectedValue(String value) {
    selectedValue = value;
    emit(SignUpSelectValueState());
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
      emit(SignUpSelectDateState());
    }
  }

  IconData passwordSuffix = Icons.visibility_outlined;
  bool passwordIsPassword = true;

  void changePassword() {
    passwordIsPassword = !passwordIsPassword;
    passwordSuffix = passwordIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  IconData confirmSuffix = Icons.visibility_outlined;
  bool confirmIsPassword = true;

  void changeConfirm() {
    confirmIsPassword = !confirmIsPassword;
    confirmSuffix = confirmIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }
}
