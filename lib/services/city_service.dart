import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:virualapi/models/city_model.dart';

class CityService {
  static Future<List<City>> find(String query) async {
    final apiKey = '8bYJmkUjtFa163ALot4DdQ==fDDzFDrRg2ewDNmI';

    final url =
        Uri.parse('https://api.api-ninjas.com/v1/city?name=$query&country=US');

    final response = await http.get(url, headers: {
      'X-Api-Key': apiKey,
    });

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print("City ANd State:$data");
      return data.map((e) => City.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
