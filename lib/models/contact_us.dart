class ContactMessage {
  final String message;

  ContactMessage({required this.message});

  factory ContactMessage.fromJson(Map<String, dynamic> json) {
    return ContactMessage(
      message: json['message'] ?? '',
    );
  }
}
