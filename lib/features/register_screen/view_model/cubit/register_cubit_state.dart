abstract class RegisterState {}

class RegisterCubitInitial extends RegisterState {}

class ChangePaswordVisibility extends RegisterState {}

class LoadingRegister extends RegisterState {}

class SuccessRegister extends RegisterState {}

class FailedRegister extends RegisterState {
  FailedRegister(this.error);
  final String error;
}
