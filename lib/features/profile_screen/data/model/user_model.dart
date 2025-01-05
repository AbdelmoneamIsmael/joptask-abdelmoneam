import 'package:tasky_abdelmoneam/core/constant/enums.dart';
import 'package:tasky_abdelmoneam/core/utils/functions/enum_function.dart';

class UserModel {
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      displayName: json["displayName"],
      username: json["username"],
      roles: json["roles"] == null
          ? []
          : List<String>.from(json["roles"]!.map((x) => x)),
      active: json["active"],
      experienceYears: json["experienceYears"],
      address: json["address"],
      level: convertPersonLevelFromString(json["level"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
  UserModel({
    required this.id,
    required this.displayName,
    required this.username,
    required this.roles,
    required this.active,
    required this.experienceYears,
    required this.address,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? displayName;
  String? username;
  List<String> roles;
  bool? active;
  num? experienceYears;
  String? address;
  PersonLevel level;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  UserModel copyWith({
    String? id,
    String? displayName,
    String? username,
    List<String>? roles,
    bool? active,
    num? experienceYears,
    String? address,
    PersonLevel? level,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? v,
  }) {
    return UserModel(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      roles: roles ?? this.roles,
      active: active ?? this.active,
      experienceYears: experienceYears ?? this.experienceYears,
      address: address ?? this.address,
      level: level ?? this.level,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "displayName": displayName,
        "username": username,
        "roles": roles.map((x) => x).toList(),
        "active": active,
        "experienceYears": experienceYears,
        "address": address,
        "level": convertPersonLevelToString(level),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return "$id, $displayName, $username, $roles, $active, $experienceYears, $address, $level, $createdAt, $updatedAt, $v, ";
  }
}
