class AirtimeBillerModel {
  final String name;
  final String code;

  AirtimeBillerModel({
    required this.name,
    required this.code,
  });

  factory AirtimeBillerModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return AirtimeBillerModel(
      name: json['name'] ?? "n/A",
      code: json['code'] ?? "n/A",
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };

  static List<AirtimeBillerModel> listFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => AirtimeBillerModel.fromJson(json)).toList();
  }
}
