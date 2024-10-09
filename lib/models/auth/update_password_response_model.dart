class UpdatePasswordResponseModel {
  final bool status;
  final List data;
  final String message;

  UpdatePasswordResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });

  // Factory method to create an instance from a JSON map
  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return UpdatePasswordResponseModel(
      status: json['status'] ?? false,
      data: json['data'] ?? [],
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
