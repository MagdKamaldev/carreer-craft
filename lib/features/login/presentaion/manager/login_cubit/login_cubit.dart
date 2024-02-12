import 'package:career_craft/features/login/data/models/user_model.dart';
import 'package:career_craft/features/login/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepository loginRepository;
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await loginRepository.login(email, password);
    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (user) {
      emit(LoginSuccess(user));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
