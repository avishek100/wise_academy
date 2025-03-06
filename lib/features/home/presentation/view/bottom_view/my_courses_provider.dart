import 'package:flutter/material.dart';

class MyCoursesProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _myCourses = [];

  List<Map<String, dynamic>> get myCourses => _myCourses;

  void addCourse(Map<String, dynamic> course) {
    _myCourses.add(course);
    notifyListeners();
  }
}
