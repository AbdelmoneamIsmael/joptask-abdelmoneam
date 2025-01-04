import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tasky_abdelmoneam/core/constant/shared_keys.dart';
import 'package:tasky_abdelmoneam/core/error/error.dart';
import 'package:tasky_abdelmoneam/core/models/login_response.dart';
import 'package:tasky_abdelmoneam/core/utils/api/api_server.dart';
import 'package:tasky_abdelmoneam/core/utils/bloc_observer/bloc_observer.dart';
import 'package:tasky_abdelmoneam/features/edit_task/presentation/data/model/task_model.dart';
import 'package:tasky_abdelmoneam/features/edit_task/view_model/repo/add_task_repo.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:mime/mime.dart';

class AddTaskRepoImpl extends AddTaskRepo {
  ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, bool>> addTask(EditTaskModel taskModel) async {
    try {
      var box = Hive.box<LoginResponse>(CachedKeys.loginResponse);
      LoginResponse? loginResponse = box.getAt(0);
      Map<String, dynamic> taskJson =
          await getImageLink(taskModel, loginResponse!.accessToken!);

      taskJson["title"] = taskModel.title;
      taskJson["desc"] = taskModel.desc;
      taskJson["priority"] = taskModel.priority;
      taskJson["dueDate"] = taskModel.dueDate?.toIso8601String();

      var result = await apiServer.post(
        endPoint: "/todos",
        data: taskJson,
        token: loginResponse.accessToken,
      );
      result.toString().printConsole;
      return const Right(true);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Map<String, dynamic>> getImageLink(
      EditTaskModel taskModel, String token) async {
    FormData formData = FormData();

    // Check if the image path is valid
    if (taskModel.image == null ||
        !await File(taskModel.image!.path).exists()) {
      throw Exception("Image file does not exist.");
    }

    // Use mime package to get the correct content type
    String? mimeType = lookupMimeType(taskModel.image!.path);
    if (mimeType == null) {
      throw Exception("Could not determine the MIME type.");
    }

    var file = await MultipartFile.fromFile(
      taskModel.image!.path,
      filename: taskModel.image!.path.split("/").last,
      contentType:
          http.MediaType.parse(mimeType), // Set the correct content type
    );

    formData.files.add(MapEntry("image", file));

    // Log the formData to ensure it contains the image
    print(formData.toString());

    var imageResult = await apiServer.post(
      endPoint: "/upload/image",
      data: formData,
      contentType: "multipart/form-data",
      token: token,
    );

    imageResult.toString().printConsole;
    return imageResult;
  }
}
