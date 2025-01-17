// ignore: file_names
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PexelsImageService {
  final String apiKey =
      'Dye0BwW0bQoVH2XNAydM6blZ38TydAb3oBclBCKO734fzXCTf8lcsOTh'; // Replace with your Pexels API key

  Future<List<Map<String, dynamic>>> fetchImages(
      {required String query, int count = 10}) async {
    final url = 'https://api.pexels.com/v1/search?query=$query&per_page=$count';
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': apiKey,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final photos = data['photos'] as List;
      return photos.map((photo) {
        return {
          'src': photo['src'],
          'photographer': photo['photographer'],
        };
      }).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
