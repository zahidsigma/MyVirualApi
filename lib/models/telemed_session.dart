class TelemedSession {
  String? id;
  String? createdBy;
  int? createdDate;
  String? modifiedBy;
  int? modifiedDate;
  bool? active;
  String? sessionId;
  String? patientId;
  String? doctorId;
  String? requestedBy;
  String? patientName;
  String? doctorName;
  String? reason;
  int? startTime;
  int? endTime;
  String? terminatedBy;
  FormData? formData;

  TelemedSession(
      {this.id,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.active,
      this.sessionId,
      this.patientId,
      this.doctorId,
      this.requestedBy,
      this.patientName,
      this.doctorName,
      this.reason,
      this.startTime,
      this.endTime,
      this.terminatedBy,
      this.formData});

  TelemedSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    active = json['active'];
    sessionId = json['sessionId'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    requestedBy = json['requestedBy'];
    patientName = json['patientName'];
    doctorName = json['doctorName'];
    reason = json['reason'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    terminatedBy = json['terminatedBy'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['active'] = this.active;
    data['sessionId'] = this.sessionId;
    data['patientId'] = this.patientId;
    data['doctorId'] = this.doctorId;
    data['requestedBy'] = this.requestedBy;
    data['patientName'] = this.patientName;
    data['doctorName'] = this.doctorName;
    data['reason'] = this.reason;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['terminatedBy'] = this.terminatedBy;
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    return data;
  }
}

class FormData {
  String? id;
  String? createdBy;
  int? createdDate;
  String? modifiedBy;
  int? modifiedDate;
  bool? active;
  Data? data;
  String? notes;
  String? patientId;

  FormData(
      {this.id,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.active,
      this.data,
      this.notes,
      this.patientId});

  FormData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    active = json['active'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    notes = json['notes'];
    patientId = json['patient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['active'] = this.active;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['notes'] = this.notes;
    data['patient_id'] = this.patientId;
    return data;
  }
}

class Data {
  String? doctor;
  String? doctorId;
  String? allergies;
  String? meds;
  String? conditions;

  Data(
      {this.doctor, this.doctorId, this.allergies, this.meds, this.conditions});

  Data.fromJson(Map<String, dynamic> json) {
    doctor = json['Doctor'];
    doctorId = json['DoctorId'];
    allergies = json['Allergies'];
    meds = json['Meds'];
    conditions = json['Conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor'] = this.doctor;
    data['DoctorId'] = this.doctorId;
    data['Allergies'] = this.allergies;
    data['Meds'] = this.meds;
    data['Conditions'] = this.conditions;
    return data;
  }
}
