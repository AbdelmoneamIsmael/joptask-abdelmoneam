import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_state.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/repo/task_operation.dart';

class TaskDetalsCubit extends Cubit<TaskDetalsState> {
  TaskDetalsCubit({required this.task, required this.taskOperation})
      : super(TaskDetalsInitial());
  TaskModel task;
  TextEditingController dateTimecontroller = TextEditingController();
  final TaskOperation taskOperation;
  @override
  Future<void> close() {
    dateTimecontroller.dispose();
    return super.close();
  }

  void updateTask() {
    emit(TaskDetalsDateUpdate());
  }

  void editTask() async {
    try {
      emit(LoadingEditTask());
      var result = await taskOperation.editTask(taskModel: task);
      result.fold(
        (failure) {
          emit(FailToDeleteTask(message: failure.message));
        },
        (success) {
          emit(
            SuccessEditTask(),
          );
        },
      );
    } catch (e) {
      emit(FailToDeleteTask(message: e.toString()));
    }
  }

  void deleteTask() async {
    try {
      emit(LoadingDeleteTask());
      var result = await taskOperation.deleteTask(taskModel: task);
      result.fold(
        (failure) {
          emit(FailToDeleteTask(message: failure.message));
        },
        (success) {
          emit(
            SuccessDeleteTask(),
          );
        },
      );
    } catch (e) {
      emit(FailToDeleteTask(message: e.toString()));
    }
  }
}
