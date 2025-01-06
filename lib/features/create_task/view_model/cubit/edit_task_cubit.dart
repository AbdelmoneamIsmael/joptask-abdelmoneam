import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tasky_abdelmoneam/core/widgets/get_image_mixin.dart';
import 'package:tasky_abdelmoneam/features/create_task/presentation/data/model/task_model.dart';
import 'package:tasky_abdelmoneam/features/create_task/view_model/cubit/edit_task_state.dart';
import 'package:tasky_abdelmoneam/features/create_task/view_model/repo/add_task_repo.dart';

class EditTaskCubit extends Cubit<EditTaskState> with ImageMixin {
  EditTaskCubit(this.addTaskRepo) : super(EditTaskInitial());
  final formKey = GlobalKey<FormState>();
  final AddTaskRepo addTaskRepo;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  File? imageFile;

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    priorityController.dispose();
    dateController.dispose();
    return super.close();
  }

  Future<void> galleryImage() async {
    emit(LoadingImageProcess());
    await Permission.storage.request();
    imageFile = await getGalleryImage();
    emit(GetGalleryImage());
  }

  Future<void> cameraImage() async {
    emit(LoadingImageProcess());
    var state = await Permission.camera.request();
    if (state.isGranted) {
      imageFile = await getCameraImage();
      emit(GetCameraImage());
    }
  }

  void addTask() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingAddTask());
      final taskModel = EditTaskModel(
        title: titleController.text,
        desc: descriptionController.text,
        priority: priorityController.text,
        dueDate: DateTime.parse(dateController.text),
        image: imageFile,
      );
      try {
        final result = await addTaskRepo.addTask(taskModel);
        result.fold(
          (l) => emit(ErrorAddTask(
            message: l.message,
          )),
          (r) => emit(SuccessAddTask()),
        );
      } on Exception catch (e) {
        emit(ErrorAddTask(message: e.toString()));
      }
    }
  }
}
