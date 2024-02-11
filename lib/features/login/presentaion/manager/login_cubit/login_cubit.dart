import 'package:bloc/bloc.dart';
import 'package:career_craft/features/login/data/models/user_model.dart';
import 'package:career_craft/features/login/data/repositories/login_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepository loginRepository;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await loginRepository.login(email, password);
    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (user) {
      emit(LoginSuccess(user));
    });
  }
}
