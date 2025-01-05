abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingAllTasks extends HomeState {}

final class LoadingMoreTasks extends HomeState {}

final class SuccessGetAllTasks extends HomeState {}

final class FaiGetAllTasks extends HomeState {
  FaiGetAllTasks({required this.message});
  final String message;
}

final class DeleteTask extends HomeState {}

final class EditTask extends HomeState {}
