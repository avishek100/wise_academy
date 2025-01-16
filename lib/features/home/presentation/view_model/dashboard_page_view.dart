// // dashboard_page.dart
// import 'package:flutter/material.dart';

// import 'categories_page.dart';
// import 'home_page.dart';
// import 'profile_page.dart';

// class DashboardPageView extends StatefulWidget {
//   final String userName;

//   const DashboardPageView({super.key, required this.userName});

//   @override
//   State<DashboardPageView> createState() => _DashboardPageViewState();
// }

// class _DashboardPageViewState extends State<DashboardPageView> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const CategoriesPage(),
//     const ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.black,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
