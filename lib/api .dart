import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomUserService {
  final String baseUrl = 'https://randomuser.me/api/';

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] as List<dynamic>;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
