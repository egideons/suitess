class LoginResponseModel {
  final bool status;
  final LoginData data;
  final String message;

  LoginResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return LoginResponseModel(
      status: json['status'] ?? false,
      data: LoginData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class LoginData {
  final String token;

  LoginData({
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return LoginData(
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
