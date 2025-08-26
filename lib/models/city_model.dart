class City {
  final String? name;
  final String? state;
  final String? country;

  City({this.name, this.state, this.country});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      state: json['region'],
      country: json['country'],
    );
  }
}
