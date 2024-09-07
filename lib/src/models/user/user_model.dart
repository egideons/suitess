class UserModel {
  bool? status;
  UserData? data;
  String? message;

  UserModel({this.status, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    status = json['status'] ?? false;
    data = json['data'] != null ? UserData.fromJson(json['data'] ?? {}) : null;
    message = json['message'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    } else {
      data['data'] = {};
    }
    data['message'] = message;
    return data;
  }
}

class UserData {
  int? id;
  String? fullname;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? passwordChangedAt;
  String? profileImage;
  String? providerName;
  String? providerId;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? settings;

  UserData({
    this.id,
    this.fullname,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.passwordChangedAt,
    this.profileImage,
    this.providerName,
    this.providerId,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.settings,
  });

  UserData.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    id = json['id'] ?? 0;
    fullname = json['fullname'] ?? "";
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    passwordChangedAt = json['password_changed_at'] ?? "";
    profileImage = json['profile_image'] ?? "";
    providerName = json['provider_name'] ?? "";
    providerId = json['provider_id'] ?? "";
    emailVerifiedAt = json['email_verified_at'] ?? "";
    phoneVerifiedAt = json['phone_verified_at'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    settings = json['settings'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password_changed_at'] = passwordChangedAt;
    data['profile_image'] = profileImage;
    data['provider_name'] = providerName;
    data['provider_id'] = providerId;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['settings'] = settings;
    return data;
  }
}
