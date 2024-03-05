part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  UserLoaded({required this.user});
}

class UserError extends UserState {
  final String message;
  UserError({required this.message});
}

class UpdateUserLoading extends UserState {}

class UpdateUserLoaded extends UserState {
  final UserModel user;
  UpdateUserLoaded({required this.user});
}

class UpdateUserError extends UserState {
  final String message;
  UpdateUserError({required this.message});
}

class ResetPasswordLoading extends UserState {}

class ResetPasswordLoaded extends UserState {
  final UserModel user;
  ResetPasswordLoaded({required this.user});
}

class ResetPasswordError extends UserState {
  final String message;
  ResetPasswordError({required this.message});
}

class SelectValueState extends UserState {}

class SelectDateState extends UserState {}

class ChangePasswordVisibilityState extends UserState {}

class DeleteUserLoading extends UserState {}

class DeleteUserLoaded extends UserState {
  final String message;
  DeleteUserLoaded({required this.message});
}

class DeleteUserError extends UserState {
  final String message;
  DeleteUserError({required this.message});
}
