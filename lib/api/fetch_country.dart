import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/model_data.dart';




Future<List<Country>> fetchCountries() async {
  final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((countryJson) => Country.fromJson(countryJson)).toList();
  } else {
    throw Exception('Failed to load countries');
  }
}