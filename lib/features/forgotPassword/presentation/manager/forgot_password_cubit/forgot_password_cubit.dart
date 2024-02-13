import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_reposiotry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordCubit(this.forgotPasswordRepository)
      : super(ForgotPasswordInitial());
  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> sendCode(String email) async {
    emit(SendCodeLoadingState());
    var result = await forgotPasswordRepository.sendPasswordResetEmail(email);
    result.fold((failure) {
      emit(SendCodeFailureState(failure.message));
    }, (message) {
      emit(SendCodeSuccessState(message));
    });
  }

  Future<void> verifyCode(String code) async {
    emit(VerifyCodeLoadingState());
    var result = await forgotPasswordRepository.sendResetCode(code);
    result.fold((failure) {
      emit(VerifyCodeFailureState(failure.message));
    }, (status) {
      emit(VerifyCodeSuccessState(status));
    });
  }

  Future<void> changePassword(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    emit(ChangePasswordLoadingState());
    var result = await forgotPasswordRepository.changePassword(
        email, password, confirmPassword);
    result.fold((failure) {
      emit(ChangePasswordFailureState(failure.message));
    }, (token) {
      emit(ChangePasswordSuccessState(token));
    });
  }

  IconData passwordSuffix = Icons.visibility_outlined;
  bool passwordIsPassword = true;

  void changePasswordVisibility() {
    passwordIsPassword = !passwordIsPassword;
    passwordSuffix = passwordIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  IconData confirmSuffix = Icons.visibility_outlined;
  bool confirmIsPassword = true;

  void changeConfirmVisibility() {
    confirmIsPassword = !confirmIsPassword;
    confirmSuffix = confirmIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }
}
