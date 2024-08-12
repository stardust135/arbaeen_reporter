class SmsModel {
  const SmsModel({
    required int statusCode,
  });

  factory SmsModel.fromJson(Map<String, dynamic> json) {
    return SmsModel(statusCode: json['return']['status']);
  }
}
