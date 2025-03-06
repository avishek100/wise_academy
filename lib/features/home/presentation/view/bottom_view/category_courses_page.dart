import 'package:flutter/material.dart';

import 'course_detail_page.dart';

class CategoryCoursesPage extends StatelessWidget {
  final String categoryName;
  CategoryCoursesPage({super.key, required this.categoryName});

  final Map<String, List<Map<String, dynamic>>> categoryCourses = {
    "3D Design": [
      {
        "title": "Blender for Beginners",
        "price": "Rs 500",
        "rating": 4.5,
        "students": 4500,
        "description": "Learn the basics of Blender for 3D design.",
        "thumbnail": "assets/images/offer1.jpg",
        "videoUrl": "https://www.youtube.com/watch?v=GQS7wPujL2k"
      },
      {
        "title": "3D Animation Basics",
        "price": "Rs 800",
        "rating": 4.3,
        "students": 3200,
        "description": "Get started with 3D animation using Blender.",
        "thumbnail": "assets/images/offer2.png",
        "videoUrl": "https://www.youtube.com/watch?v=181JQ7ypS3w"
      },
      {
        "title": "3D Animation Basics",
        "price": "Rs 800",
        "rating": 4.3,
        "students": 3200,
        "description": "Get started with 3D animation using Blender.",
        "thumbnail": "assets/images/offer2.png",
        "videoUrl":
            "https://www.youtube.com/watch?v=pF--YKCCUMw&list=PLqKRc0Oi7q20wxXVUNiS15S2MvtSqOtLV"
      },
    ],
    "Graphic Design": [
      {
        "title": "Graphic Design Advanced",
        "price": "Rs 300",
        "rating": 4.2,
        "students": 7830,
        "description": "Master advanced graphic design techniques.",
        "thumbnail": "assets/images/graphic_design.jpg",
        "videoUrl": "https://www.youtube.com/watch?v=-a0bgFY1onU"
      },
    ],
    "Programming": [
      {
        "title": "Flutter Development",
        "price": "Rs 700",
        "rating": 4.7,
        "students": 12000,
        "description": "Learn how to develop mobile apps using Flutter.",
        "thumbnail": "assets/images/flutter_course.jpg",
        "videoUrl": "https://www.youtube.com/watch?v=1xipg02Wu8s"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCourses =
        categoryCourses[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Courses in $categoryName")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search $categoryName',
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

            // Course List
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to Course Detail Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetailPage(course: course),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(course["title"],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            '${course["price"]} | ⭐ ${course["rating"]} | ${course["students"]} Std'),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            course["thumbnail"],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
