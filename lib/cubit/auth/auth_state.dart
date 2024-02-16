part of 'auth_cubit_.dart';

@immutable
sealed class AuthState {}

final class AuthCubitInitial extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginLoading extends AuthState {
  
}
final class LoginFailure extends AuthState {
  final String error;
  LoginFailure(this.error);
}
final class RegisterSuccess extends AuthState {}
final class RegisterLoading extends AuthState {}
final class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure(this.error);
}

