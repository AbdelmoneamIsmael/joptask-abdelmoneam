abstract class TaskDetalsState {}

final class TaskDetalsInitial extends TaskDetalsState {}

final class TaskDetalsDateUpdate extends TaskDetalsState {}

final class LoadingEditTask extends TaskDetalsState {}

final class SuccessEditTask extends TaskDetalsState {}

final class FailToEditTask extends TaskDetalsState {
  FailToEditTask({required this.message});
  final String message;
}
final class LoadingDeleteTask extends TaskDetalsState {}

final class SuccessDeleteTask extends TaskDetalsState {}

final class FailToDeleteTask extends TaskDetalsState {
  FailToDeleteTask({required this.message});
  final String message;
}

