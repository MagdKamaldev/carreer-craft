part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserModel user;
  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure(this.message);
}

class SignUpChangePasswordVisibilityState extends SignUpState {}

class SignUpSelectDateState extends SignUpState {}

class SignUpSelectValueState extends SignUpState {}
