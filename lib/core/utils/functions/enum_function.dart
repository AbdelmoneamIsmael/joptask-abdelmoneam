import 'package:tasky_abdelmoneam/core/constant/enums.dart';

/// this is for TaskStatus
///

/// convert TaskStatus to string
String convertTaskStatusToString(TaskStatus status) {
  switch (status) {
    case TaskStatus.waiting:
      return "Waiting";

    case TaskStatus.inprogress:
      return "Inprogress";

    case TaskStatus.finished:
      return "Finished";
  }
}

///get PersonLevel TaskStatus from  string
TaskStatus convertTaskStatusFromString(String status) {
  switch (status) {
    case "waiting":
      return TaskStatus.waiting;

    case "inprogress":
      return TaskStatus.inprogress;

    case "finished":
      return TaskStatus.finished;

    default:
      return TaskStatus.waiting;
  }
}

///
///

///
/// this is for TaskPiriorty
///
///

/// convert TaskPiriorty to string
String convertTaskPeriorityToString(TaskPiriorty priority) {
  switch (priority) {
    case TaskPiriorty.low:
      return "Low";

    case TaskPiriorty.medium:
      return "Medium";

    case TaskPiriorty.high:
      return "High";
  }
}

///get TaskPiriorty  from  string
TaskPiriorty convertTaskPriorityFromString(String priority) {
  switch (priority) {
    case "low":
      return TaskPiriorty.low;

    case "medium":
      return TaskPiriorty.medium;

    case "high":
      return TaskPiriorty.high;

    default:
      return TaskPiriorty.low;
  }
}

///
///
///
///get PersonLevel  from  string
PersonLevel convertPersonLevelFromString(String level) {
  switch (level) {
    case "fresh":
      return PersonLevel.fresh;

    case "junior":
      return PersonLevel.junior;

    case "midLevel":
      return PersonLevel.midLevel;

    case "senior":
      return PersonLevel.senior;

    default:
      return PersonLevel.fresh;
  }
}

/// convert PersonLevel to string
String convertPersonLevelToString(PersonLevel level) {
  switch (level) {
    case PersonLevel.fresh:
      return "Fresh";

    case PersonLevel.junior:
      return "Junior";

    case PersonLevel.midLevel:
      return "MidLevel";

    case PersonLevel.senior:
      return "Senior";
  }
}
