import 'package:flutter/material.dart';
import 'package:library_app/constant_colors.dart';
import 'package:library_app/models/author_model.dart';
import 'package:library_app/models/create_book_model.dart';
import 'package:library_app/pages/Books/book_home.dart';
import 'package:library_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class NewBookPage extends StatefulWidget {
  const NewBookPage({Key? key}) : super(key: key);

  @override
  _NewBookPageState createState() => _NewBookPageState();
}

class _NewBookPageState extends State<NewBookPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  AuthorModel? selectedAuthor;
  late var appProvider;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    selectedAuthor = null;

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _addNewBook(AppProvider appProvider) {
    final String title = titleController.text.trim();
    final String description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || selectedAuthor == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: const Text('Please fill in all required fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final CreateBookModel newBook = CreateBookModel(
      bookTitle: title,
      bookDescription: description,
      bookImage: 'abc',
      authorId: selectedAuthor!.auhtorId.toString(),
    );

    // Add the new book to the provider
    appProvider.addBook(newBook);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BooksHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);

    final filteredAuthors =
        appProvider.allAuthors.where((author) => author.auhtorId != 0).toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter the book title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the book title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter the book description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the book description';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<AuthorModel>(
                  value: selectedAuthor,
                  onChanged: (AuthorModel? value) {
                    setState(() {
                      selectedAuthor = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Author',
                  ),
                  items: filteredAuthors
                      .map<DropdownMenuItem<AuthorModel>>((AuthorModel author) {
                    return DropdownMenuItem<AuthorModel>(
                      value: author,
                      child: Text(author.auhtorName),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an author';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _addNewBook(appProvider),
                  child: const Text('Add Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
