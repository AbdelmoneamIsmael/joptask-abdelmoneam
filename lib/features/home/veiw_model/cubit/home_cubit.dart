import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:tasky_abdelmoneam/core/models/task_model.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/cubit/home_state.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/get_all_tasks.dart';
import 'package:tasky_abdelmoneam/core/configuration/text_extention.dart';
import 'package:tasky_abdelmoneam/features/home/veiw_model/repo/log_out_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getAllTasksRepo, required this.logOutRepo})
      : super(HomeInitial());
  final scrollController = ScrollController();
  final GetAllTasksRepo getAllTasksRepo;
  final LogOutRepo logOutRepo;
  List<TaskModel> tasks = [];
  int pageNumber = 1;
  int pageSize = 20;
  bool isThereMoreTasks = true;
  List<String> filters = [
    "all",
    "inprogress",
    "waiting",
    "finished",
  ];
  int selectedFilter = 0;

  onInit() async {
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        double currentPosition = scrollController.position.pixels;
        double maxScrollExtent = scrollController.position.maxScrollExtent;
        double seventyPercentOffset = maxScrollExtent * 0.7;
        if (currentPosition >= seventyPercentOffset &&
            state is! LoadingMoreTasks &&
            isThereMoreTasks) {
          featchAllTsks();
        }
      }
    });
    featchAllTsks();
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  Future featchAllTsks() async {
    if (pageNumber == 1) {
      emit(LoadingAllTasks());
    } else {
      emit(LoadingMoreTasks());
    }
    try {
      var result = await getAllTasksRepo.getAllTasks(
        pageNumber: pageNumber,
        status: selectedFilter == 0 ? null : filters[selectedFilter],
      );
      result.fold(
        (failure) => emit(FaiGetAllTasks(message: failure.message)),
        (success) {
          " incomming tasks ${success.length}".toString().printConsole;
          if (success.length < pageSize) {
            isThereMoreTasks = false;
          }
          tasks.addAll(success);
          pageNumber++;
          emit(
            SuccessGetAllTasks(),
          );
        },
      );
    } on Exception catch (e) {
      emit(FaiGetAllTasks(message: e.toString()));
    }
  }

  Future<void> refresh() async {
    tasks.clear();
    pageNumber = 1;
    isThereMoreTasks = true;

    await featchAllTsks();
  }

  void deleteTask(
    TaskModel task,
  ) {
    tasks.removeWhere((element) => element.id == task.id);
    emit(DeleteTask());
  }

  void editTask() {
    emit(EditTask());
  }

  void changeFilter(int index) {
    selectedFilter = index;
    emit(ChangeFilter());
    refresh();
  }

  void logout() async {
    emit(LoadingLogout());
    try {
      var result = await logOutRepo.logOut();
      result.fold(
        (failure) => emit(FaiLogout(message: failure.message)),
        (success) => emit(
          LogoutSuccess(),
        ),
      );
    } on Exception catch (e) {
      emit(FaiLogout(message: e.toString()));
    }
  }
}
