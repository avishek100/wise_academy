import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course_detail_page.dart';
import 'my_courses_provider.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCourses = Provider.of<MyCoursesProvider>(context).myCourses;

    return Scaffold(
      appBar: AppBar(title: const Text("My Courses")),
      body: myCourses.isEmpty
          ? const Center(child: Text("No courses purchased."))
          : ListView.builder(
              itemCount: myCourses.length,
              itemBuilder: (context, index) {
                final course = myCourses[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailPage(course: course),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(course["title"],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:
                          Text('${course["price"]} | ⭐ ${course["rating"]}'),
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
    );
  }
}
