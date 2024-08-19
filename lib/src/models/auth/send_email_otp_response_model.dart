class SendEmailOTPResponseModel {
  final bool status;
  final List<dynamic> data;
  final String message;

  SendEmailOTPResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  // Factory method to create an instance from a JSON map
  factory SendEmailOTPResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return SendEmailOTPResponseModel(
      status: json['status'] ?? false,
      data: List<dynamic>.from(json['data'] ?? []),
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
