sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess<T> extends AuthState {
  final bool isAuthenticated;
  final T? data;

  AuthSuccess({required this.isAuthenticated, this.data});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
