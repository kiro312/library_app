class Config {
  static const String apiUrl = "http://192.168.1.4:8080/api/";

  // Books Endpoints
  static const String getAllBooks = "${apiUrl}books";
  static const String getBookById = "${apiUrl}books/";
  static const String createBook = "${apiUrl}books";
  static const String updateBook = "${apiUrl}books/";

  // Authors Endpoints
  static const String getAllAuthors = "${apiUrl}authors";
  static const String getAuthorById = "${apiUrl}authors/";
  static const String createAuthor = "${apiUrl}authors";
  static const String updateAuthor = "${apiUrl}authors/";
}
