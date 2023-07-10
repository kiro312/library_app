import 'package:library_app/models/author_model.dart';

class BookModel {
  late int id;
  late String bookTitle;
  late String bookDescription;
  late String bookImage;
  late AuthorModel bookAuthor;

  BookModel({
    required this.id,
    required this.bookTitle,
    required this.bookDescription,
    required this.bookImage,
    required this.bookAuthor,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookTitle = json['bookTitle'];
    bookDescription = json['bookDescription'];
    bookImage = json['bookImage'];
    bookAuthor = AuthorModel.fromJson(json['bookAuthor']);
  }
}
