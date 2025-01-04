import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/cubit/register_cubit_state.dart';
import 'package:tasky_abdelmoneam/features/register_screen/data/model/register_model.dart';
import 'package:tasky_abdelmoneam/features/register_screen/view_model/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterCubitInitial());
  final RegisterRepo registerRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController yearsExperienceController = TextEditingController();
  TextEditingController experienceLevelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String countryCode = "+20";
  bool passwordOffVisible = true;

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    yearsExperienceController.dispose();
    addressController.dispose();
    passwordController.dispose();
    experienceLevelController.dispose();
    return super.close();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoadingRegister());
        final registerModel = RegisterModel(
          phone: countryCode + phoneController.text,
          password: passwordController.text,
          displayName: nameController.text,
          experienceYears: double.parse(yearsExperienceController.text),
          address: addressController.text,
          level: experienceLevelController.text,
        );
        var reslut = await registerRepo.register(registerModel: registerModel);
        reslut.fold(
          (l) => emit(FailedRegister(l.message)),
          (r) async {
            var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
            await box.clear();
            box.add(r);
            emit(SuccessRegister());
          },
        );
      } catch (e) {
        emit(
          FailedRegister(
            e.toString(),
          ),
        );
      }
    }
  }

  void changePasswordVisibility() {
    passwordOffVisible = !passwordOffVisible;
    emit(ChangePaswordVisibility());
  }
}
