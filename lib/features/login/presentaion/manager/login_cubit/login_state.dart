part of 'login_cubit.dart';

abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final UserModel user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginStates {
  final String message;

  LoginFailure(this.message);
}

class ChangePasswordVisibilityState extends LoginStates {}
