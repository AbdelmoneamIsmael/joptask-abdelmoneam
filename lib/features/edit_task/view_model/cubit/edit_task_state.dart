abstract class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class GetCameraImage extends EditTaskState {}

final class GetGalleryImage extends EditTaskState {}

final class LoadingImageProcess extends EditTaskState {}

final class LoadingAddTask extends EditTaskState {}

final class SuccessAddTask extends EditTaskState {}

final class ErrorAddTask extends EditTaskState {
  ErrorAddTask({required this.message});
  final String message;
}
