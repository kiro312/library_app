import 'dart:convert';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/create_book_model.dart';
import 'package:library_app/services/config.dart';
import 'package:http/http.dart' as http;

class BookService {
  static var client = http.Client();

  static Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
  };

  static Future<List<BookModel>> getBooks() async {
    var url = Uri.parse(Config.getAllBooks);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> booksData = jsonResponse['data'];
      return booksData.map((data) => BookModel.fromJson(data)).toList();
    }
    return [];
  }

  static Future addBook(CreateBookModel book) async {
    var url = Uri.parse(Config.createBook);
    var response = await client.post(url,
        headers: requestHeaders, body: json.encode(book.toJson()));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
