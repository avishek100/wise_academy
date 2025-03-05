import 'dart:convert';

import 'package:e_learning/features/courses/presentation/view/courses_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> allCourses = [];
  List<dynamic> filteredCourses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  // ✅ Fetch courses from the backend
  Future<void> fetchCourses() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.18.29:5003/courses/all"));

      if (response.statusCode == 200) {
        List<dynamic> courses = json.decode(response.body);
        setState(() {
          allCourses = courses;
          filteredCourses = courses;
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load courses");
      }
    } catch (e) {
      print("Error fetching courses: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // ✅ Search courses
  void _filterCourses(String query) {
    setState(() {
      filteredCourses = allCourses
          .where((course) =>
              course["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  String getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.trim().isEmpty) {
      return "https://via.placeholder.com/150"; // Use placeholder if empty
    }
    return "http://10.0.2.2:5003${imagePath.trim()}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, // Set AppBar color to blue
        elevation: 0,
        title: const Text(
          "Courses", // Title instead of image
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: 24, // Adjust size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                // Implement navigation for cart or wishlist
              },
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.white), // White cart icon
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _searchController,
              onChanged: _filterCourses,
              decoration: InputDecoration(
                hintText: "Search courses...",
                prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 📚 Course List or Loading Indicator
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredCourses.isEmpty
                      ? const Center(
                          child: Text(
                            "No courses found!",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredCourses.length,
                          itemBuilder: (context, index) {
                            final course = filteredCourses[index];
                            return _buildCourseCard(context, course);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, dynamic course) {
    String formatPrice(dynamic price) {
      if (price == null) return "N/A";
      return "\$${NumberFormat("#,##0.00").format(price)}"; // Format price with $
    }

    return GestureDetector(
      onTap: () {
        // ✅ Navigate to Course Details Page with Data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(
              title: course["title"],
              description: course["description"],
              imageUrl: getImageUrl(course["image"]),
              price: course["price"]?.toDouble() ?? 0.0,
              rating: course["rating"]?.toDouble() ?? 0.0,
              courseId: '', // Handle rating if null
            ),
          ),
        );
      },
      child: Card(
        color: Colors.blue[50], // Light blue background
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📷 Course Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  getImageUrl(course["image"]),
                  width: 110,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/placeholder.png",
                    width: 110,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // 📖 Course Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course["title"] ?? "No title",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      course["description"] ?? "No description",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // 💰 Price & ⭐ Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatPrice(course["price"]),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 18),
                            Text(
                              (course["rating"]?.toDouble() ?? 0.0)
                                  .toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
