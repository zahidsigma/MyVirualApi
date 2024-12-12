class Specialties {
  String? id;
  String? name;
  String? specialityDesc;

  Specialties({this.id, this.name, this.specialityDesc});

  Specialties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    specialityDesc = json['specialityDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['specialityDesc'] = this.specialityDesc;
    return data;
  }
}
