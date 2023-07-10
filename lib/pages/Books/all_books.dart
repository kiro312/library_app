import 'package:flutter/material.dart';
import 'package:library_app/ReusableWidgets/loader.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/pages/Books/widgets/book_widget.dart';
import 'package:library_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key});

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  TextEditingController searchController = TextEditingController();
  late String selectedAuthor = "All";

  List<Widget> _buildBooks(List<BookModel> books) {
    return books.map((book) {
      return Column(
        children: [
          BookWidget(book: book),
          const SizedBox(height: 8.0),
        ],
      );
    }).toList();
  }

  List<BookModel> searchBooks(String query) {
    return appProvider.allbooks.where((book) {
      final title = book.bookTitle.toLowerCase();
      final authorName = book.bookAuthor.auhtorName.toLowerCase();
      final searchLower = query.toLowerCase();

      if (selectedAuthor == "All" || selectedAuthor.isEmpty) {
        return title.contains(searchLower);
      } else {
        return title.contains(searchLower) &&
            authorName.contains(selectedAuthor.toLowerCase());
      }
    }).toList();
  }

  late AppProvider appProvider;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      appProvider = Provider.of<AppProvider>(context, listen: false);
      // selectedAuthor = appProvider.allAuthors.first.auhtorName;
      setState(() {
        isLoading = false;
      });
    });
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    if (isLoading) {
      return const LoaderWidget();
    } else {
      if (appProvider.allbooks.isEmpty) {
        return const Center(
          child: Text(
            'No Books Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
      return Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                // search bar
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                // filter by author
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: DropdownButton<String>(
                    value: selectedAuthor,
                    onChanged: (String? value) {
                      setState(() {
                        selectedAuthor = value!;
                      });
                    },
                    items: appProvider.allAuthors.map((author) {
                      return DropdownMenuItem<String>(
                        value: author.auhtorName,
                        child: Text(author.auhtorName),
                      );
                    }).toList(),
                  ),
                ),

                ..._buildBooks(searchBooks(searchController.text)),
              ],
            ),
          ),
        ),
      );
    }
  }
}
