// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wise_academy/features/home/presentation/view_model/home_cubit.dart';
// import 'package:wise_academy/features/home/presentation/view_model/home_state.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//         return state.views.elementAt(state.selectedIndex);
//       }),
//       bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book),
//                 label: 'Available Courses',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book_online_sharp),
//                 label: 'My Courses',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle_outlined),
//                 label: 'Account',
//               ),
//             ],
//             currentIndex: state.selectedIndex,
//             backgroundColor: Colors.white,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.black,
//             onTap: (index) {
//               context.read<HomeCubit>().onTabTapped(index);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wise_academy/features/home/presentation/view/bottom_view/available_courses_page.dart';
import 'package:wise_academy/features/home/presentation/view/bottom_view/dashboard_page_view.dart';
import 'package:wise_academy/features/home/presentation/view/bottom_view/my_account_page.dart';
import 'package:wise_academy/features/home/presentation/view/bottom_view/my_course_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPageView(), // Home
    AvailableCoursesPage(), // Available Courses
    const MyCoursesPage(), // My Courses
    const AccountPage(), // Account
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Available Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online_sharp), label: "My Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
