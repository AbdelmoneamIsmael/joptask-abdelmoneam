class RegisterModel {
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      phone: json["phone"],
      password: json["password"],
      displayName: json["displayName"],
      experienceYears: json["experienceYears"],
      address: json["address"],
      level: json["level"],
    );
  }
  RegisterModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  String? phone;
  String? password;
  String? displayName;
  num? experienceYears;
  String? address;
  String? level;

  RegisterModel copyWith({
    String? phone,
    String? password,
    String? displayName,
    num? experienceYears,
    String? address,
    String? level,
  }) {
    return RegisterModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
      experienceYears: experienceYears ?? this.experienceYears,
      address: address ?? this.address,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "displayName": displayName,
        "experienceYears": experienceYears,
        "address": address,
        "level": level,
      };

  @override
  String toString() {
    return "$phone, $password, $displayName, $experienceYears, $address, $level, ";
  }
}
