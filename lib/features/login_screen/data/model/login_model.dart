class LoginModel {
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      phone: json["phone"],
      password: json["password"],
    );
  }
  LoginModel({
    required this.phone,
    required this.password,
  });

  String? phone;
  String? password;

  LoginModel copyWith({
    String? phone,
    String? password,
  }) {
    return LoginModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };

  @override
  String toString() {
    return "$phone, $password, ";
  }
}
