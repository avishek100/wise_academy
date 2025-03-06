import 'package:flutter/material.dart';
import 'package:wise_academy/features/home/presentation/view/bottom_view/category_courses_page.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<Map<String, dynamic>> _allCategories = [
    {"name": "3D Design", "icon": Icons.design_services},
    {"name": "Arts & Humanities", "icon": Icons.palette},
    {"name": "Graphic Design", "icon": Icons.brush},
    {"name": "Marketing", "icon": Icons.campaign},
    {"name": "Programming", "icon": Icons.code},
    {"name": "Business", "icon": Icons.business},
    {"name": "Health & Fitness", "icon": Icons.fitness_center},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Categories")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _allCategories.length,
        itemBuilder: (context, index) {
          final category = _allCategories[index];
          return GestureDetector(
            onTap: () {
              // Navigate to CategoryCoursesPage for that category
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
                Icon(category['icon'], size: 40, color: Colors.blue),
                Text(category['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}
