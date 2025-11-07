import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/features/auth/data/auth_repo.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepo.login(email, password);
      Future.delayed(const Duration(seconds: 2), () {});
      if (response.success) {
        emit(AuthSuccess(isAuthenticated: true, data: response.data as bool));
      } else {
        emit(AuthError(message: response.message));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void signup(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepo.signup(email, password);
      Future.delayed(const Duration(seconds: 2), () {});
      if (response.success) {
        emit(AuthSuccess(isAuthenticated: true, data: response.data as bool));
      } else {
        emit(AuthError(message: response.message));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
