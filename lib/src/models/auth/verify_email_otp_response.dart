class VerifyEmailOtpResponse {
  final bool status;
  final EmailData data;
  final String message;

  VerifyEmailOtpResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory VerifyEmailOtpResponse.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return VerifyEmailOtpResponse(
      status: json['status'] ?? false,
      data: EmailData.fromJson(json['data'] ?? {}),
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

class EmailData {
  final String token;

  EmailData({
    required this.token,
  });

  factory EmailData.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return EmailData(
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
