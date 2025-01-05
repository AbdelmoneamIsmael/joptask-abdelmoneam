import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/features/task_details/view_model/cubit/task_detals_state.dart';

class TaskDetalsCubit extends Cubit<TaskDetalsState> {
  TaskDetalsCubit({required this.task}) : super(TaskDetalsInitial());
  TaskModel task;
  TextEditingController dateTimecontroller = TextEditingController();
  @override
  Future<void> close() {
    dateTimecontroller.dispose();
    return super.close();
  }

  void updateTask() {
    emit(TaskDetalsDateUpdate());
  }
}
