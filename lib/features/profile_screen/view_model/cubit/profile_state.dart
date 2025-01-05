import 'package:tasky_abdelmoneam/features/profile_screen/data/model/user_model.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadedSuccess extends ProfileState {
  ProfileLoadedSuccess({required this.userModel});
  final UserModel userModel;
}

final class ProfileError extends ProfileState {
  ProfileError(this.message);
  final String message;
}