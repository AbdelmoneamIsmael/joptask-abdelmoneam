import 'dart:io';

class EditTaskModel {
  factory EditTaskModel.fromJson(Map<String, dynamic> json) {
    return EditTaskModel(
      image: json["image"],
      title: json["title"],
      desc: json["desc"],
      priority: json["priority"],
      dueDate: DateTime.tryParse(json["dueDate"] ?? ""),
    );
  }
  EditTaskModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  File? image;
  String? title;
  String? desc;
  String? priority;
  DateTime? dueDate;

  EditTaskModel copyWith({
    File? image,
    String? title,
    String? desc,
    String? priority,
    DateTime? dueDate,
  }) {
    return EditTaskModel(
      image: image ?? this.image,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "desc": desc,
        "priority": priority,
        "dueDate": dueDate?.toIso8601String(),
      };

  @override
  String toString() {
    return "$image, $title, $desc, $priority, $dueDate, ";
  }
}
