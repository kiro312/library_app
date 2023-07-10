import 'dart:convert';
import 'package:library_app/models/author_model.dart';
import 'package:library_app/services/config.dart';
import 'package:http/http.dart' as http;

class AuthorService {
  static var client = http.Client();

  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
  };

  static Future<List<AuthorModel>> getAuthors() async {
    var url = Uri.parse(Config.getAllAuthors);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> booksData = jsonResponse['data'];
      return booksData.map((data) => AuthorModel.fromJson(data)).toList();
    }
    return [];
  }
}
