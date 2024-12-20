// dashboard_page.dart
import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class DashboardPageView extends StatefulWidget {
  final String userName;

  const DashboardPageView({super.key, required this.userName});

  @override
  State<DashboardPageView> createState() => _DashboardPageViewState();
}

class _DashboardPageViewState extends State<DashboardPageView> {
  // Track the index of the selected tab
  int _selectedIndex = 0;

  // List of pages to switch between
  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const ProfilePage(),
  ];

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Text(
      //     'Hi, ${widget.userName}',
      //     style: const TextStyle(color: Colors.black),
      //   ),
      // ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Update the selected index
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
