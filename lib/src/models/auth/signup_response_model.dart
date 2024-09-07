import '../user/user_signup_model.dart';

class SignupResponseModel {
  final bool status;
  final UserSignupDataModel data;
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
      data: UserSignupDataModel.fromJson(json['data'] ?? {}),
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
