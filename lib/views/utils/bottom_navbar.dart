import 'package:flutter/material.dart';
import 'package:meal_suggest/views/add_meal_screen.dart';
import 'package:meal_suggest/views/home_screen.dart';
import 'package:meal_suggest/views/saved_meal_screen.dart';
import 'package:meal_suggest/views/search_meal_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<Widget> screenList = [
    HomeScreen(),
    SearchMealScreen(),
    AddMealScreen(),
    SavedMealScreen(),
  ];
  int currentIndex = 0;
  void _changeCurrentScreen(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _changeCurrentScreen,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), label: "Library"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
