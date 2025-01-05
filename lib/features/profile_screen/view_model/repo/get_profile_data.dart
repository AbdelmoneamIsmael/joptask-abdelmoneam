import 'package:dartz/dartz.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/features/profile_screen/data/model/user_model.dart';

abstract class GetProfileData {
  Future<Either <Failure, UserModel>> getProfileData();
}