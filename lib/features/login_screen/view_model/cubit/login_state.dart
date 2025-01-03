abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePaswordVisibility extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailed extends LoginState {
  LoginFailed({required this.error});
  final String error;
}
