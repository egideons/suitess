class MobileDataBillerModel {
  final String name;
  final String code;

  MobileDataBillerModel({
    required this.name,
    required this.code,
  });

  factory MobileDataBillerModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return MobileDataBillerModel(
      name: json['name'] ?? "n/A",
      code: json['code'] ?? "n/A",
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };

  static List<MobileDataBillerModel> listFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) => MobileDataBillerModel.fromJson(json))
        .toList();
  }
}
