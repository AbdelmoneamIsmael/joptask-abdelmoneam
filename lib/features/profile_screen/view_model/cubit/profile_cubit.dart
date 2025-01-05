import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/cubit/profile_state.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/view_model/repo/get_profile_data.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getProfileDataRepo) : super(ProfileInitial());
  final GetProfileData getProfileDataRepo;
  TextEditingController phoneController = TextEditingController();
  onInit() async {
    await getProfileData();
  }

  @override
  Future<void> close() async {
    phoneController.dispose();
    super.close();
  }

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      var result = await getProfileDataRepo.getProfileData();
      result.fold(
        (l) => emit(ProfileError(l.message)),
        (r) => emit(
          ProfileLoadedSuccess(userModel: r),
        ),
      );
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters from the phone number
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned number has at least 2 digits
    if (cleanedNumber.length >= 2) {
      // Format the phone number dynamically
      String formattedNumber =
          '+${cleanedNumber.substring(0, 2)}'; // Country code

      // Add the rest of the digits in groups of 3, separated by '-'
      for (int i = 2; i < cleanedNumber.length; i += 3) {
        if (i + 3 <= cleanedNumber.length) {
          formattedNumber +=
              '${i != 2 ? '-' : ' '}${cleanedNumber.substring(i, i + 3)}';
        } else {
          formattedNumber += ' ${cleanedNumber.substring(i)}';
        }
      }

      // Return the formatted phone number
      return formattedNumber;
    }

    // Return the original phone number if formatting fails
    return phoneNumber;
  }
}
