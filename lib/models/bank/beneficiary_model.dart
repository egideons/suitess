class BeneficiaryModel {
  final String name;
  final String bankCode;
  final String bankName;
  final String accountNumber;

  BeneficiaryModel({
    required this.name,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BeneficiaryModel(
      name: json['name'] ?? "n/A",
      bankCode: json['bankCode'] ?? "n/A",
      bankName: json['bankName'] ?? "n/A",
      accountNumber: json['accountNumber'] ?? "n/A",
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'bankCode': bankCode,
        'bankName': bankName,
        'accountNumber': accountNumber,
      };

  static List<BeneficiaryModel> listFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => BeneficiaryModel.fromJson(json)).toList();
  }
}
