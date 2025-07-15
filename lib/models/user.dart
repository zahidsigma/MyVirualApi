// class User {
//   String? id;
//   int? createdDate;
//   String? modifiedBy;
//   int? modifiedDate;
//   bool? active;
//   String? name;
//   String? username;
//   int? dob;
//   String? email;
//   String? gender;
//   String? application;
//   String? platform;
//   String? role;
//   String? customerId;
//   PicMetaData? picMetaData;
//   CustomerInfo? customerInfo;
//   String? group;
//   double? height;
//   double? weight;
//   Contact? contact;
//   String? bloodgrp;
//   String? habits;
//   String? employeeCode;

//   User(
//       {this.id,
//       this.createdDate,
//       this.modifiedBy,
//       this.modifiedDate,
//       this.active,
//       this.name,
//       this.username,
//       this.dob,
//       this.email,
//       this.gender,
//       this.application,
//       this.platform,
//       this.role,
//       this.customerId,
//       this.picMetaData,
//       this.customerInfo,
//       this.group,
//       this.height,
//       this.weight,
//       this.contact,
//       this.bloodgrp,
//       this.habits,
//       this.employeeCode});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdDate = json['createdDate'];
//     modifiedBy = json['modifiedBy'];
//     modifiedDate = json['modifiedDate'];
//     active = json['active'];
//     name = json['name'];
//     username = json['username'];
//     dob = json['dob'];
//     email = json['email'];
//     gender = json['gender'];
//     application = json['application'];
//     platform = json['platform'];
//     role = json['role'];
//     customerId = json['customerId'];
//     picMetaData = json['picMetaData'] != null
//         ? new PicMetaData.fromJson(json['picMetaData'])
//         : null;
//     customerInfo = json['customerInfo'] != null
//         ? new CustomerInfo.fromJson(json['customerInfo'])
//         : null;
//     group = json['group'];
//     height = json['height'];
//     weight = json['weight'];
//     contact =
//         json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
//     bloodgrp = json['bloodgrp'];
//     habits = json['habits'];
//     employeeCode = json['employeeCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['createdDate'] = this.createdDate;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedDate'] = this.modifiedDate;
//     data['active'] = this.active;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['dob'] = this.dob;
//     data['email'] = this.email;
//     data['gender'] = this.gender;
//     data['application'] = this.application;
//     data['platform'] = this.platform;
//     data['role'] = this.role;
//     data['customerId'] = this.customerId;
//     if (this.picMetaData != null) {
//       data['picMetaData'] = this.picMetaData!.toJson();
//     }
//     if (this.customerInfo != null) {
//       data['customerInfo'] = this.customerInfo!.toJson();
//     }
//     data['group'] = this.group;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     if (this.contact != null) {
//       data['contact'] = this.contact!.toJson();
//     }
//     data['bloodgrp'] = this.bloodgrp;
//     data['habits'] = this.habits;
//     data['employeeCode'] = this.employeeCode;
//     return data;
//   }
// }

// class PicMetaData {
//   String? id;
//   String? createdBy;
//   int? createdDate;
//   String? modifiedBy;
//   int? modifiedDate;
//   bool? active;
//   String? recordType;
//   String? relPath;
//   String? fileName;
//   String? patientId;
//   int? fileSize;
//   String? publicUrl;

//   PicMetaData(
//       {this.id,
//       this.createdBy,
//       this.createdDate,
//       this.modifiedBy,
//       this.modifiedDate,
//       this.active,
//       this.recordType,
//       this.relPath,
//       this.fileName,
//       this.patientId,
//       this.fileSize,
//       this.publicUrl});

//   PicMetaData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdBy = json['createdBy'];
//     createdDate = json['createdDate'];
//     modifiedBy = json['modifiedBy'];
//     modifiedDate = json['modifiedDate'];
//     active = json['active'];
//     recordType = json['recordType'];
//     relPath = json['relPath'];
//     fileName = json['fileName'];
//     patientId = json['patientId'];
//     fileSize = json['fileSize'];
//     publicUrl = json['publicUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['createdBy'] = this.createdBy;
//     data['createdDate'] = this.createdDate;
//     data['modifiedBy'] = this.modifiedBy;
//     data['modifiedDate'] = this.modifiedDate;
//     data['active'] = this.active;
//     data['recordType'] = this.recordType;
//     data['relPath'] = this.relPath;
//     data['fileName'] = this.fileName;
//     data['patientId'] = this.patientId;
//     data['fileSize'] = this.fileSize;
//     data['publicUrl'] = this.publicUrl;
//     return data;
//   }
// }

// class CustomerInfo {
//   String? name;
//   Logo? logo;
//   String? city;
//   String? country;
//   String? customerId;

//   CustomerInfo(
//       {this.name, this.logo, this.city, this.country, this.customerId});

//   CustomerInfo.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
//     city = json['city'];
//     country = json['country'];
//     customerId = json['customer_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.logo != null) {
//       data['logo'] = this.logo!.toJson();
//     }
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['customer_id'] = this.customerId;
//     return data;
//   }
// }

// class Logo {
//   String? recordType;
//   int? fileSize;
//   String? fileType;
//   String? publicUrl;

//   Logo({this.recordType, this.fileSize, this.fileType, this.publicUrl});

//   Logo.fromJson(Map<String, dynamic> json) {
//     recordType = json['recordType'];
//     fileSize = json['fileSize'];
//     fileType = json['fileType'];
//     publicUrl = json['publicUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['recordType'] = this.recordType;
//     data['fileSize'] = this.fileSize;
//     data['fileType'] = this.fileType;
//     data['publicUrl'] = this.publicUrl;
//     return data;
//   }
// }

// class Contact {
//   String? phone1;
//   String? phone2;
//   String? address1;
//   String? city;
//   String? country;

//   Contact({this.phone1, this.phone2, this.address1, this.city, this.country});

//   Contact.fromJson(Map<String, dynamic> json) {
//     phone1 = json['phone1'];
//     phone2 = json['phone2'];
//     address1 = json['address1'];
//     city = json['city'];
//     country = json['country'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['phone1'] = this.phone1;
//     data['phone2'] = this.phone2;
//     data['address1'] = this.address1;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     return data;
//   }
// }

class User {
  final bool status;
  final Data data;
  final String message;

  User({
    required this.status,
    required this.data,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? city;
  final String? zipCode;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.zipCode,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      zipCode: json['zip_code'],
      image: json['image'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'zip_code': zipCode,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
