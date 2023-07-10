import 'package:flutter/material.dart';
import 'package:library_app/ReusableWidgets/loader.dart';
import 'package:library_app/constant_colors.dart';
import 'package:library_app/pages/Books/all_books.dart';
import 'package:library_app/pages/Books/new_book.dart';
import 'package:library_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class BooksHomePage extends StatefulWidget {
  const BooksHomePage({super.key});

  @override
  State<BooksHomePage> createState() => _BooksHomePageState();
}

class _BooksHomePageState extends State<BooksHomePage> {
  var appProvider;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      appProvider = Provider.of<AppProvider>(context, listen: false);

      await appProvider.setAllBooks();

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoaderWidget();
    } else {
      return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.mainColor,
                    ),
                    child: const TabBar(
                        indicator: BoxDecoration(
                          color: AppColors.secondaryColor,
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'All Books',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Add new Book',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [AllBooksPage(), NewBookPage()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
