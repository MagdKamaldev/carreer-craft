part of 'forgot_password_cubit.dart';


abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

class SendCodeLoadingState extends ForgotPasswordState {}

class SendCodeSuccessState extends ForgotPasswordState {
  final String message;
  SendCodeSuccessState(this.message);
}

class SendCodeFailureState extends ForgotPasswordState {
  final String message;
  SendCodeFailureState(this.message);
}

class VerifyCodeLoadingState extends ForgotPasswordState {}

class VerifyCodeSuccessState extends ForgotPasswordState {
  final String status;
  VerifyCodeSuccessState(this.status);
}

class VerifyCodeFailureState extends ForgotPasswordState {
  final String message;
  VerifyCodeFailureState(this.message);
}

class ChangePasswordLoadingState extends ForgotPasswordState {}

class ChangePasswordSuccessState extends ForgotPasswordState {
  final String token;
  ChangePasswordSuccessState(this.token);
}

class ChangePasswordFailureState extends ForgotPasswordState {
  final String message;
  ChangePasswordFailureState(this.message);
}

class SignUpChangePasswordVisibilityState extends ForgotPasswordState {}
