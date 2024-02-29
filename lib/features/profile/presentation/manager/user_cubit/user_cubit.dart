// ignore_for_file: body_might_complete_normally_catch_error
import 'package:career_craft/core/models/user_model.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ProfileRepositoryImplementation profileRepositoryImplementation;
  UserCubit(this.profileRepositoryImplementation) : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  Future<UserModel> getUser() {
    emit(UserLoading());
    return profileRepositoryImplementation.getUser().then((user) {
      emit(UserLoaded(user: user));
      return user;
    }).catchError((e) {
      emit(UserError(message: e.toString()));
    });
  }
}
