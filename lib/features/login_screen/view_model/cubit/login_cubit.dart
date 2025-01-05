import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/features/login_screen/data/model/login_model.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/cubit/login_state.dart';
import 'package:tasky_abdelmoneam/features/login_screen/view_model/login_repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final LoginRepo loginRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool securePassword = true;
  String countryCode = "+20";
  @override
  Future<void> close() {
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void changePasswordVisibility() {
    securePassword = !securePassword;
    emit(ChangePaswordVisibility());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoginLoading());
        LoginModel loginModel = LoginModel(
          phone: countryCode + phoneController.text,
          password: passwordController.text,
        );
        var result = await loginRepo.login(loginModel: loginModel);
        result.fold(
          (l) => emit(LoginFailed(error: l.message)),
          (r) async {
          
            emit(
              LoginSuccess(),
            );
          },
        );
      } on Exception catch (e) {
        emit(LoginFailed(error: e.toString()));
      }
    }
  }
}
