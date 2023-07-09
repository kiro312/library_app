import 'package:flutter/material.dart';
import 'package:library_app/constant_colors.dart';
import 'package:library_app/pages/Books/book_home.dart';
import 'package:library_app/pages/authors/author_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const BooksHomePage(),
    const AuthorsHomePage(),
  ];

  static const List<BottomNavigationBarItem> _bottomNavigationBarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.book,
        size: 30,
      ),
      label: 'Books',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        size: 30,
      ),
      label: 'Authors',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mainColor,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
