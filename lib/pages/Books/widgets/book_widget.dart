import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class BookWidget extends StatelessWidget {
  final BookModel book;

  const BookWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  book.bookImage,
                  height: 150,
                  width: 250,
                ),
                const SizedBox(height: 10.0),
                Text(
                  book.bookTitle,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'By ${book.bookAuthor.auhtorName}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add logic to show more details
                    },
                    child: const Text(
                      'Show More Details',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
