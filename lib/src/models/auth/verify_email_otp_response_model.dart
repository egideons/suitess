class VerifyOTPResponseModel {
  final bool status;
  final String data;
  final String message;

  VerifyOTPResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  // Factory method to create an instance from a JSON map
  factory VerifyOTPResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return VerifyOTPResponseModel(
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
