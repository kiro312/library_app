import 'package:flutter/material.dart';
import 'package:library_app/ReusableWidgets/loader.dart';
import 'package:library_app/constant_colors.dart';
import 'package:library_app/pages/authors/all_authors.dart';
import 'package:library_app/pages/authors/new_author.dart';
import 'package:library_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class AuthorsHomePage extends StatefulWidget {
  const AuthorsHomePage({super.key});

  @override
  State<AuthorsHomePage> createState() => _AuthorsHomePageState();
}

class _AuthorsHomePageState extends State<AuthorsHomePage> {
  var appProvider;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      appProvider = Provider.of<AppProvider>(context, listen: false);

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
                              'All Authors',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Add new Author',
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
                      children: [AllAthuorsPage(), NewAuthorPage()],
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
