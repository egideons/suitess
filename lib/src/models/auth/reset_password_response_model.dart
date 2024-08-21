class ResetPasswordResponseModel {
  final bool status;
  final String data;
  final String message;

  ResetPasswordResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  // Factory method to create an instance from a JSON map
  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return ResetPasswordResponseModel(
      status: json['status'] ?? false,
      data: json['data'] ?? "",
      message: json['message'] ?? "",
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
      'message': message,
    };
  }
}