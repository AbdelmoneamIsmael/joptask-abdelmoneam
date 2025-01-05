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
    // Here you would format the phone number to match your mask
    // For example, if the phone number is just digits, format it accordingly
    // This is just a placeholder logic; adjust according to your needs
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Example, assuming the phone number should match +00 000-000-00000-0000-00000
    // Adjust the formatting logic according to your requirements
    if (cleanedNumber.length == 13) {
      // Adjust based on expected length
      return '+${cleanedNumber.substring(0, 2)} ${cleanedNumber.substring(2, 5)}-${cleanedNumber.substring(5, 8)}-${cleanedNumber.substring(8, 12)}-${cleanedNumber.substring(12, 13)}';
    }
    return phoneNumber; // Return the original if formatting fails
  }
}
