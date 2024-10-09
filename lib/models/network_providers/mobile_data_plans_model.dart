class MobileDataPlanModel {
  final String name;
  final int price;
  final String code;

  MobileDataPlanModel({
    required this.name,
    required this.price,
    required this.code,
  });

  factory MobileDataPlanModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return MobileDataPlanModel(
      name: json['name'] ?? "n/A",
      price: json['price'] ?? 0,
      code: json['code'] ?? "n/A",
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'code': code,
      };

  static List<MobileDataPlanModel> listFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => MobileDataPlanModel.fromJson(json)).toList();
  }
}
