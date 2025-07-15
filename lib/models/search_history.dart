class SearchHistoryModel {
  final bool status;
  final String message;
  final List<OrderData> data;

  SearchHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryModel(
      status: json['status'],
      message: json['message'],
      data:
          List<OrderData>.from(json['data'].map((x) => OrderData.fromJson(x))),
    );
  }

  get reversed => null;
}

class OrderData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String userId;
  final List<Report> reports;
  final String total;
  final String hasSocialMediaReport;
  final String isSocialMediaReportSent;
  final List<String> reportLinks;
  final String isMob;
  final String createdAt;
  final String updatedAt;

  OrderData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.reports,
    required this.total,
    required this.hasSocialMediaReport,
    required this.isSocialMediaReportSent,
    required this.reportLinks,
    required this.isMob,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      userId: json['user_id'],
      reports:
          List<Report>.from(json['reports'].map((x) => Report.fromJson(x))),
      total: json['total'],
      hasSocialMediaReport: json['has_social_media_report'],
      isSocialMediaReportSent: json['is_social_media_report_sent'],
      reportLinks: List<String>.from(json['report_links']),
      isMob: json['is_mob'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Report {
  final String label;
  final String key;
  final double price;
  final int count;

  Report({
    required this.label,
    required this.key,
    required this.price,
    required this.count,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      label: json['label'],
      key: json['key'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'].toDouble(),
      count: json['count'],
    );
  }
}
