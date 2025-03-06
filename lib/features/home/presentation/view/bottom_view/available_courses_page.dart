import 'package:flutter/material.dart';

import 'category_courses_page.dart';

class AvailableCoursesPage extends StatelessWidget {
  AvailableCoursesPage({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "3D Design", "icon": Icons.design_services},
    {"name": "Arts & Humanities", "icon": Icons.palette},
    {"name": "Graphic Design", "icon": Icons.brush},
    {"name": "Programming", "icon": Icons.code},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Courses")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryCoursesPage(categoryName: category['name']),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category['icon'], size: 50, color: Colors.blue),
                Text(category['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}
