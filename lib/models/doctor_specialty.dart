class DoctorSpecialty {
  String? specialty;
  List<Doctors>? doctors;

  DoctorSpecialty({this.specialty, this.doctors});

  DoctorSpecialty.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialty'] = this.specialty;
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? createdDate;
  String? name;
  String? username;
  String? gender;
  String? role;
  PicMetaData? picMetaData;
  String? education;
  String? experience;
  bool? online;
  bool? busy;
  DoctorRating? doctorRating;

  Doctors(
      {this.createdDate,
      this.name,
      this.username,
      this.gender,
      this.role,
      this.picMetaData,
      this.education,
      this.experience,
      this.online,
      this.busy,
      this.doctorRating});

  Doctors.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    name = json['name'];
    username = json['username'];
    gender = json['gender'];
    role = json['role'];
    picMetaData = json['picMetaData'] != null
        ? new PicMetaData.fromJson(json['picMetaData'])
        : null;
    education = json['education'];
    experience = json['experience'];
    online = json['online'];
    busy = json['busy'];
    doctorRating = json['doctorRating'] != null
        ? new DoctorRating.fromJson(json['doctorRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdDate'] = this.createdDate;
    data['name'] = this.name;
    data['username'] = this.username;
    data['gender'] = this.gender;
    data['role'] = this.role;
    if (this.picMetaData != null) {
      data['picMetaData'] = this.picMetaData!.toJson();
    }
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['online'] = this.online;
    data['busy'] = this.busy;
    if (this.doctorRating != null) {
      data['doctorRating'] = this.doctorRating!.toJson();
    }
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
