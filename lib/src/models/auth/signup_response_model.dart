class SignupResponseModel {
  final bool status;
  final SignupResponseData data;
  final String message;

  SignupResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  // Factory constructor to create an instance from JSON
  factory SignupResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return SignupResponseModel(
      status: json['status'] ?? false,
      data: SignupResponseData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? "",
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class SignupResponseData {
  final String fullname;
  final String phone;
  final String email;
  final String updatedAt;
  final String createdAt;
  final int id;

  SignupResponseData({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Factory constructor to create an instance from JSON
  factory SignupResponseData.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return SignupResponseData(
      fullname: json['fullname'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      createdAt: json['created_at'] ?? "",
      id: json['id'] ?? 0,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
