class PricingResponse {
  final bool status;
  final PricingData data;
  final String message;

  PricingResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PricingResponse.fromJson(Map<String, dynamic> json) {
    return PricingResponse(
      status: json['status'] ?? false,
      data: PricingData.fromJson(json['data']),
      message: json['message'] ?? '',
    );
  }
}

class PricingData {
  final int id;
  final List<PricingType> types;
  final String createdAt;
  final String updatedAt;

  PricingData({
    required this.id,
    required this.types,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PricingData.fromJson(Map<String, dynamic> json) {
    return PricingData(
      id: json['id'],
      types:
          (json['types'] as List).map((e) => PricingType.fromJson(e)).toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class PricingType {
  final String label;
  final String key;
  final int price;
  final int count;

  PricingType({
    required this.label,
    required this.key,
    required this.price,
    required this.count,
  });

  factory PricingType.fromJson(Map<String, dynamic> json) {
    return PricingType(
      label: json['label'],
      key: json['key'],
      price: json['price'],
      count: json['count'],
    );
  }
}
