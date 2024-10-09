class UserModel {
  bool? status;
  UserData? data;
  String? message;

  UserModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return UserModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      message: json['message'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data?.toJson();
    data['message'] = message;
    return data;
  }
}

class UserData {
  int? id;
  String? uid;
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
  Settings? settings;

  UserData({
    required this.id,
    required this.uid,
    required this.fullname,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.passwordChangedAt,
    required this.profileImage,
    required this.providerName,
    required this.providerId,
    required this.emailVerifiedAt,
    required this.phoneVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.settings,
  });

  factory UserData.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return UserData(
      id: json['id'] ?? 0,
      uid: json['uid'] ?? "n/A",
      fullname: json['fullname'] ?? "n/A",
      firstName: json['first_name'] ?? "n/A",
      lastName: json['last_name'] ?? "n/A",
      email: json['email'] ?? "n/A",
      phone: json['phone'] ?? "n/A",
      passwordChangedAt: json['password_changed_at'],
      profileImage: json['profile_image'] ?? "n/A",
      providerName: json['provider_name'] ?? "",
      providerId: json['provider_id'] ?? "",
      emailVerifiedAt: json['email_verified_at'] ?? "",
      phoneVerifiedAt: json['phone_verified_at'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      settings:
          json['settings'] != null ? Settings.fromJson(json['settings']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
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
    data['settings'] = settings?.toJson();
    return data;
  }
}

class Settings {
  int? id;
  String? userId;
  String? language;
  String? address;
  String? geoLocation;
  String? username;
  String? createdAt;
  String? updatedAt;

  Settings({
    required this.id,
    required this.userId,
    required this.language,
    required this.address,
    required this.geoLocation,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Settings.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Settings(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? "n/A",
      language: json['language'] ?? "n/A",
      address: json['address'] ?? "n/A",
      geoLocation: json['geo_location'] ?? "n/A",
      username: json['username'] ?? "n/A",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['language'] = language;
    data['address'] = address;
    data['geo_location'] = geoLocation;
    data['username'] = username;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
