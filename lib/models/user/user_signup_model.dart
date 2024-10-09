class UserSignupDataModel {
  String fullname;
  String phone;
  String email;
  String password;
  String passwordConfirmation;

  UserSignupDataModel({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  // Factory method to create an instance from a JSON map
  factory UserSignupDataModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return UserSignupDataModel(
      fullname: json['fullname'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      passwordConfirmation: json['password_confirmation'] ?? "",
    );
  }

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
