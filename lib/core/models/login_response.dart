class LoginResponse {
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json["_id"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }
  LoginResponse({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

  String? id;
  String? accessToken;
  String? refreshToken;

  LoginResponse copyWith({
    String? id,
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponse(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };

  @override
  String toString() {
    return "$id, $accessToken, $refreshToken, ";
  }
}
