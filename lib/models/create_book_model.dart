// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateBookModel {
  late String bookTitle;
  late String bookDescription;
  late String bookImage;
  late String authorId;

  CreateBookModel({
    required this.bookTitle,
    required this.bookDescription,
    required this.bookImage,
    required this.authorId,
  });

  CreateBookModel.fromJson(Map<String, dynamic> json) {
    bookTitle = json['book_title'];
    bookDescription = json['book_description'];
    bookImage = json['book_image'];
    authorId = json['author_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_title'] = bookTitle;
    data['book_description'] = bookDescription;
    data['book_image'] = bookImage;
    data['author_id'] = authorId;
    return data;
  }

  @override
  String toString() {
    return 'CreateBookModel(bookTitle: $bookTitle, bookDescription: $bookDescription, bookImage: $bookImage, authorId: $authorId)';
  }
}
