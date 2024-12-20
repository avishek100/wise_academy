// import 'package:flutter/material.dart';

// class DashboardPageView extends StatefulWidget {
//   final String userName;

//   const DashboardPageView({super.key, required this.userName});

//   @override
//   State<DashboardPageView> createState() => _DashboardPageViewState();
// }

// class _DashboardPageViewState extends State<DashboardPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Hi, ${widget.userName}',
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "What Would you like to learn Today?",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search for...",
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Today's Special Section
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "25% OFF*",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       "Today's Special",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       "Get a Discount for Every Course Order only Valid for Today.!",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Categories Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Categories",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text("SEE ALL"),
//                   ),
//                 ],
//               ),
//               const Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: [
//                   CategoryChip(label: "3D Design"),
//                   CategoryChip(label: "Arts & Humanities"),
//                   CategoryChip(label: "Graphic Design"),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Popular Courses Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Popular Courses",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text("SEE ALL"),
//                   ),
//                 ],
//               ),
//               Wrap(
//                 spacing: 10,
//                 children: [
//                   FilterChip(label: "All", onPressed: () {}),
//                   FilterChip(label: "Graphic Design", onPressed: () {}),
//                   FilterChip(label: "3D Design", onPressed: () {}),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Course Card
//               const CourseCard(
//                 title: "Graphic Design Advanced",
//                 price: "Rs 200",
//                 rating: 4.2,
//                 students: 7830,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryChip extends StatefulWidget {
//   final String label;

//   const CategoryChip({super.key, required this.label});

//   @override
//   State<CategoryChip> createState() => _CategoryChipState();
// }

// class _CategoryChipState extends State<CategoryChip> {
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(widget.label),
//       backgroundColor: Colors.grey[200],
//     );
//   }
// }

// class FilterChip extends StatefulWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const FilterChip({super.key, required this.label, required this.onPressed});

//   @override
//   State<FilterChip> createState() => _FilterChipState();
// }

// class _FilterChipState extends State<FilterChip> {
//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: Text(widget.label),
//       selected: false,
//       onSelected: (bool selected) {
//         widget.onPressed();
//       },
//     );
//   }
// }

// class CourseCard extends StatefulWidget {
//   final String title;
//   final String price;
//   final double rating;
//   final int students;

//   const CourseCard({
//     super.key,
//     required this.title,
//     required this.price,
//     required this.rating,
//     required this.students,
//   });

//   @override
//   State<CourseCard> createState() => _CourseCardState();
// }

// class _CourseCardState extends State<CourseCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.black26, // Placeholder for course image
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     widget.price,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       const SizedBox(width: 4),
//                       Text(widget.rating.toString()),
//                       const SizedBox(width: 8),
//                       Text("${widget.students} Std"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class DashboardPageView extends StatefulWidget {
//   final String userName;

//   const DashboardPageView({super.key, required this.userName});

//   @override
//   State<DashboardPageView> createState() => _DashboardPageViewState();
// }

// class _DashboardPageViewState extends State<DashboardPageView> {
//   // Track the index of the selected tab
//   int _selectedIndex = 0;

//   // Function to handle tab changes
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Define the different views for each tab
//     List<Widget> pages = [
//       _buildDashboardPage(),
//       _buildCategoriesPage(),
//       _buildProfilePage(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Hi, ${widget.userName}',
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: pages[_selectedIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped, // Update the selected index
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

//   // Home page content (Dashboard Page)
//   Widget _buildDashboardPage() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "What Would you like to learn Today?",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Search for...",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Today's Special Section
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "25% OFF*",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "Today's Special",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "Get a Discount for Every Course Order only Valid for Today.!",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Categories Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Categories",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text("SEE ALL"),
//                 ),
//               ],
//             ),
//             const Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 CategoryChip(label: "3D Design"),
//                 CategoryChip(label: "Arts & Humanities"),
//                 CategoryChip(label: "Graphic Design"),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Popular Courses Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Popular Courses",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text("SEE ALL"),
//                 ),
//               ],
//             ),
//             Wrap(
//               spacing: 10,
//               children: [
//                 FilterChip(label: "All", onPressed: () {}),
//                 FilterChip(label: "Graphic Design", onPressed: () {}),
//                 FilterChip(label: "3D Design", onPressed: () {}),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Course Card
//             const CourseCard(
//               title: "Graphic Design Advanced",
//               price: "Rs 200",
//               rating: 4.2,
//               students: 7830,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Categories page content (To be added later)
//   Widget _buildCategoriesPage() {
//     return const Center(
//       child: Text(
//         'Categories Page',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }

//   // Profile page content (To be added later)
//   Widget _buildProfilePage() {
//     return const Center(
//       child: Text(
//         'Profile Page',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }

// class CategoryChip extends StatefulWidget {
//   final String label;

//   const CategoryChip({super.key, required this.label});

//   @override
//   State<CategoryChip> createState() => _CategoryChipState();
// }

// class _CategoryChipState extends State<CategoryChip> {
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(widget.label),
//       backgroundColor: Colors.grey[200],
//     );
//   }
// }

// class FilterChip extends StatefulWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const FilterChip({super.key, required this.label, required this.onPressed});

//   @override
//   State<FilterChip> createState() => _FilterChipState();
// }

// class _FilterChipState extends State<FilterChip> {
//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: Text(widget.label),
//       selected: false,
//       onSelected: (bool selected) {
//         widget.onPressed();
//       },
//     );
//   }
// }

// class CourseCard extends StatefulWidget {
//   final String title;
//   final String price;
//   final double rating;
//   final int students;

//   const CourseCard({
//     super.key,
//     required this.title,
//     required this.price,
//     required this.rating,
//     required this.students,
//   });

//   @override
//   State<CourseCard> createState() => _CourseCardState();
// }

// class _CourseCardState extends State<CourseCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.black26, // Placeholder for course image
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     widget.price,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.amber, size: 16),
//                       const SizedBox(width: 4),
//                       Text(widget.rating.toString()),
//                       const SizedBox(width: 8),
//                       Text("${widget.students} Std"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hi, ${widget.userName}',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
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
