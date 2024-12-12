class SpecialtiesDoctors {
  String? specialty;
  List<SpecialityDoctor>? doctors;

  SpecialtiesDoctors({this.specialty, this.doctors});

  SpecialtiesDoctors.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
    if (json['doctors'] != null) {
      doctors = <SpecialityDoctor>[];
      json['doctors'].forEach((v) {
        doctors!.add(new SpecialityDoctor.fromJson(v));
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

class SpecialityDoctor {
  String? name;
  String? gender;

  SpecialityDoctor({this.name, this.gender});

  SpecialityDoctor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    return data;
  }
}
