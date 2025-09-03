import 'dart:convert';
import 'package:http/http.dart' as http;


//api get 요청
class GeoApiService {
 // Replace with your actual base URL
  final String baseUrl='http://3.34.183.53/api/v1';

  //api get 요청
  Future<Map<String, dynamic>> getGeoData(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/geo/${id}'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load report data');
    }
  }
}