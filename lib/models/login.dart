class Login {
  String? authToken;
  String? tokenType;
  String? role;
  String? userId;
  int? issuedAt;
  int? expires;

  Login(
      {this.authToken,
      this.tokenType,
      this.role,
      this.userId,
      this.issuedAt,
      this.expires});

  Login.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    tokenType = json['tokenType'];
    role = json['role'];
    userId = json['userId'];
    issuedAt = json['issuedAt'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authToken'] = this.authToken;
    data['tokenType'] = this.tokenType;
    data['role'] = this.role;
    data['userId'] = this.userId;
    data['issuedAt'] = this.issuedAt;
    data['expires'] = this.expires;
    return data;
  }
}
