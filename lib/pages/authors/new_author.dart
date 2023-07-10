import 'package:flutter/material.dart';
import 'package:library_app/ReusableWidgets/custom_snackbar.dart';
import 'package:library_app/constant_colors.dart';
import 'package:library_app/models/author_model.dart';
import 'package:library_app/pages/Books/book_home.dart';
import 'package:library_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class NewAuthorPage extends StatefulWidget {
  const NewAuthorPage({Key? key}) : super(key: key);

  @override
  _NewAuthorPageState createState() => _NewAuthorPageState();
}

class _NewAuthorPageState extends State<NewAuthorPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();

    super.dispose();
  }

  void _addNewAuthor(AppProvider appProvider) {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String bio = bioController.text.trim();

    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: const Text('Please enter the author name.'),
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

    final AuthorModel newAuthor = AuthorModel(
      auhtorId: 0, // Set the author ID as per your implementation
      auhtorName: name,
      auhtorEmail: email.isNotEmpty ? email : null,
      auhtorBio: bio.isNotEmpty ? bio : null,
    );

    // Add the new author to the provider
    if (appProvider.addAuthor(newAuthor) == true) {
      CustomSnackbar.buildErrorSnackbar(
        context,
        "Created",
        AppColors.greenAlertColor,
      );
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BooksHomePage(),
          ),
        );
      });
    } else {
      CustomSnackbar.buildErrorSnackbar(
        context,
        "Error",
        AppColors.redAlertColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

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
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter the author name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the author name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter the author email (optional)',
                  ),
                ),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    hintText: 'Enter the author bio (optional)',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => _addNewAuthor(appProvider),
                  child: const Text('Add Author'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
