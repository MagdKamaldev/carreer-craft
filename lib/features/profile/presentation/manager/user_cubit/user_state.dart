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
