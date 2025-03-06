import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyCoursesProvider with ChangeNotifier {
  final Box _courseBox = Hive.box('purchasedCourses');
  List<Map<String, dynamic>> _myCourses = [];

  MyCoursesProvider() {
    _loadCourses();
  }

  List<Map<String, dynamic>> get myCourses => _myCourses;

  void _loadCourses() {
    _myCourses = _courseBox
        .get('courses', defaultValue: []).cast<Map<String, dynamic>>();
    notifyListeners();
  }

  void addCourse(Map<String, dynamic> course) {
    if (!_myCourses.any((c) => c["title"] == course["title"])) {
      _myCourses.add(course);
      _courseBox.put('courses', _myCourses);
      notifyListeners();
    }
  }
}
