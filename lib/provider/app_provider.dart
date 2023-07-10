import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/book_service.dart';

class AppProvider extends ChangeNotifier {
  List<BookModel> allbooks = [];

  Future<void> setAllBooks() async {
    allbooks = await BookService.getBooks();
    print(allbooks.length);
    notifyListeners();
  }
}
