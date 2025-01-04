class TaskModel {
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["_id"],
      image: json["image"],
      title: json["title"],
      desc: json["desc"],
      priority: json["priority"],
      status: json["status"],
      user: json["user"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
  TaskModel({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  TaskModel copyWith({
    String? id,
    String? image,
    String? title,
    String? desc,
    String? priority,
    String? status,
    String? user,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? v,
  }) {
    return TaskModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "title": title,
        "desc": desc,
        "priority": priority,
        "status": status,
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return "$id, $image, $title, $desc, $priority, $status, $user, $createdAt, $updatedAt, $v, ";
  }
}
