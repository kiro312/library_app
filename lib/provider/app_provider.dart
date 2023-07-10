import 'package:flutter/material.dart';
import 'package:library_app/models/author_model.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/create_book_model.dart';
import 'package:library_app/services/author_service.dart';
import 'package:library_app/services/book_service.dart';

class AppProvider extends ChangeNotifier {
  List<BookModel> allbooks = [];
  List<AuthorModel> allAuthors = [];

  Future<void> setAllBooks() async {
    allbooks = await BookService.getBooks();
    notifyListeners();
  }

  Future<void> setAllAuthors() async {
    allAuthors = await AuthorService.getAuthors();

    // Add "All" as the first item in the list
    allAuthors.insert(
      0,
      AuthorModel(
        auhtorId: 0,
        auhtorName: "All",
      ),
    );

    notifyListeners();
  }

  Future<void> addBook(CreateBookModel book) async {
    await BookService.addBook(book);
  }
}
