import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DashboardPageView());
}

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<String> _carouselImages = [
    'assets/images/offer1.jpg',
    'assets/images/offer2.png',
    'assets/images/offer3.png',
  ];

  final List<Map<String, dynamic>> _categories = [
    {"name": "3D Design", "icon": Icons.design_services},
    {"name": "Arts & Humanities", "icon": Icons.palette},
    {"name": "Graphic Design", "icon": Icons.brush},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi, Abhishek'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for..',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Carousel Slider with Images
            CarouselSlider(
              options: CarouselOptions(height: 150.0, autoPlay: true),
              items: _carouselImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Categories',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    // Navigate to Categories Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesPage()),
                    );
                  },
                  child: const Text('SEE ALL',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Category List (Only showing first 3)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to Specific Category Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailPage(categoryName: category['name']),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(category['icon'], size: 40, color: Colors.blue),
                      Text(category['name']),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Popular Courses
            const Text('Popular Courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            // Course Filter Chips
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterChip(
                    label: const Text('All'), onSelected: (bool value) {}),
                FilterChip(
                    label: const Text('Graphic Design'),
                    onSelected: (bool value) {}),
                FilterChip(
                    label: const Text('3D Design'),
                    onSelected: (bool value) {}),
              ],
            ),

            const SizedBox(height: 20),

            // Course Card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: const Text('Graphic Design Advanced',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Rs 200 | ⭐ 4.2 | 7830 Std'),
                leading: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/graphic_design.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Categories Page (Displays All Categories)
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
              // Navigate to Specific Category Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailPage(categoryName: category['name']),
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

// Category Detail Page
class CategoryDetailPage extends StatelessWidget {
  final String categoryName;
  const CategoryDetailPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Center(
        child: Text("Courses in $categoryName",
            style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
