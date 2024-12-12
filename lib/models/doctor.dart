class Doctor {
  String? id;
  int? createdDate;
  String? modifiedBy;
  int? modifiedDate;
  bool? active;
  String? name;
  String? username;
  String? email;
  String? gender;
  String? platform;
  String? role;
  String? customerId;
  String? notes;
  PicMetaData? picMetaData;
  CustomerInfo? customerInfo;
  String? specialty;
  String? officeLoc;
  String? education;
  String? experience;
  String? timezone;
  List<String>? keywords;
  double? consultingCost;
  List<String>? languages;
  bool? online;
  bool? busy;
  DoctorRating? doctorRating;
  String? regNo;

  Doctor(
      {this.id,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.active,
      this.name,
      this.username,
      this.email,
      this.gender,
      this.platform,
      this.role,
      this.customerId,
      this.notes,
      this.picMetaData,
      this.customerInfo,
      this.specialty,
      this.officeLoc,
      this.education,
      this.experience,
      this.timezone,
      this.keywords,
      this.consultingCost,
      this.languages,
      this.online,
      this.busy,
      this.doctorRating,
      this.regNo});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    active = json['active'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    platform = json['platform'];
    role = json['role'];
    customerId = json['customerId'];
    notes = json['notes'];
    picMetaData = json['picMetaData'] != null
        ? new PicMetaData.fromJson(json['picMetaData'])
        : null;
    customerInfo = json['customerInfo'] != null
        ? new CustomerInfo.fromJson(json['customerInfo'])
        : null;
    specialty = json['specialty'];
    officeLoc = json['officeLoc'];
    education = json['education'];
    experience = json['experience'];
    timezone = json['timezone'];
    keywords = json['keywords']?.cast<String>();
    consultingCost = json['consultingCost'];
    languages = json['languages'].cast<String>();
    online = json['online'];
    busy = json['busy'];
    doctorRating = json['doctorRating'] != null
        ? new DoctorRating.fromJson(json['doctorRating'])
        : null;
    regNo = json['regNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['active'] = this.active;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['platform'] = this.platform;
    data['role'] = this.role;
    data['customerId'] = this.customerId;
    data['notes'] = this.notes;
    if (this.picMetaData != null) {
      data['picMetaData'] = this.picMetaData!.toJson();
    }
    if (this.customerInfo != null) {
      data['customerInfo'] = this.customerInfo!.toJson();
    }
    data['specialty'] = this.specialty;
    data['officeLoc'] = this.officeLoc;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['timezone'] = this.timezone;
    data['keywords'] = this.keywords;
    data['consultingCost'] = this.consultingCost;
    data['languages'] = this.languages;
    data['online'] = this.online;
    data['busy'] = this.busy;
    if (this.doctorRating != null) {
      data['doctorRating'] = this.doctorRating!.toJson();
    }
    data['regNo'] = this.regNo;
    return data;
  }
}

class PicMetaData {
  String? recordType;
  int? fileSize;
  String? publicUrl;

  PicMetaData({this.recordType, this.fileSize, this.publicUrl});

  PicMetaData.fromJson(Map<String, dynamic> json) {
    recordType = json['recordType'];
    fileSize = json['fileSize'];
    publicUrl = json['publicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordType'] = this.recordType;
    data['fileSize'] = this.fileSize;
    data['publicUrl'] = this.publicUrl;
    return data;
  }
}

class CustomerInfo {
  String? name;
  Logo? logo;
  String? city;
  String? country;
  String? customerId;

  CustomerInfo(
      {this.name, this.logo, this.city, this.country, this.customerId});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    city = json['city'];
    country = json['country'];
    customerId = json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    data['city'] = this.city;
    data['country'] = this.country;
    data['customer_id'] = this.customerId;
    return data;
  }
}

class Logo {
  String? recordType;
  int? fileSize;
  String? fileType;
  String? publicUrl;

  Logo({this.recordType, this.fileSize, this.fileType, this.publicUrl});

  Logo.fromJson(Map<String, dynamic> json) {
    recordType = json['recordType'];
    fileSize = json['fileSize'];
    fileType = json['fileType'];
    publicUrl = json['publicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordType'] = this.recordType;
    data['fileSize'] = this.fileSize;
    data['fileType'] = this.fileType;
    data['publicUrl'] = this.publicUrl;
    return data;
  }
}

class DoctorRating {
  double? rating;
  int? totalReviews;

  DoctorRating({this.rating, this.totalReviews});

  DoctorRating.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    totalReviews = json['totalReviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['totalReviews'] = this.totalReviews;
    return data;
  }
}
