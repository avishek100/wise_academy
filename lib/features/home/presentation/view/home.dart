import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/app/di/di.dart';
import 'package:e_learning/app/shared_prefs/token_shared_prefs.dart';
import 'package:e_learning/features/auth/domain/repository/auth_repository.dart';
import 'package:e_learning/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IAuthRepository _authRepository;
  List<dynamic> popularCourses = [];
  bool isLoading = true;
  bool showAllCourses = false;
  // Shake detection variables
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  double _lastX = 0.0;
  static const double _shakeThreshold = 15.0;
  DateTime? _lastShakeTime;
  static const int _shakeCooldown = 500;

  // Brightness control variables
  double _originalBrightness = 0.5;

  @override
  void initState() {
    super.initState();
    _authRepository = getIt<IAuthRepository>();
    fetchCourses();
    _startShakeDetection();
    _getCurrentBrightness();
  }
// Toggle for "SEE ALL" and "SHOW LESS"

  // ✅ Fetch Courses from Backend
  Future<void> fetchCourses() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.18.29:5003/courses/all"));

      if (response.statusCode == 200) {
        List<dynamic> courses = json.decode(response.body);
        setState(() {
          popularCourses = courses.take(5).toList(); // Take first 5 courses
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

  void _startShakeDetection() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      final now = DateTime.now();
      if (_lastShakeTime != null &&
          now.difference(_lastShakeTime!).inMilliseconds < _shakeCooldown) {
        return;
      }
      final double deltaX = event.x - _lastX;
      if (deltaX.abs() > _shakeThreshold) {
        setState(() {
          showAllCourses = !showAllCourses;
        });
        _lastShakeTime = now;
      }
      _lastX = event.x;
    });
  }

  void _getCurrentBrightness() async {
    try {
      _originalBrightness = await ScreenBrightness().current;
    } catch (e) {
      print('Error getting brightness: $e');
      _originalBrightness = 0.5;
    }
  }

  Future<void> _setScreenMaxBrightness() async {
    try {
      await ScreenBrightness().setScreenBrightness(1.0);
    } catch (e) {
      print('Error setting max brightness: $e');
    }
  }

  Future<void> _restoreBrightness() async {
    try {
      await ScreenBrightness().setScreenBrightness(_originalBrightness);
    } catch (e) {
      print('Error restoring brightness: $e');
    }
  }

  void logoutUser(BuildContext context) async {
    // ✅ Clear Authentication Token (But NOT Onboarding Preference)
    await getIt<TokenSharedPrefs>().clearToken();

    // ✅ Navigate Directly to Login Page (Onboarding Preference Stays)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  // ✅ Get Image URL
  String getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return "https://via.placeholder.com/150"; // Placeholder image
    }
    return "http://192.168.18.29:5003${imagePath.trim()}"; // Full URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // ✅ Title
            const Text(
              "What would you like to learn today?",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 15),

            // ✅ Search Bar
            _buildSearchBar(),

            const SizedBox(height: 20),

            // ✅ Discount Banner
            _buildImageCarousel(),

            const SizedBox(height: 20),

            // ✅ Categories Section

            const SizedBox(height: 20),

            // ✅ Popular Courses Section
            _buildPopularCourses(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue, // Set the background color to blue
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Wise Academy', // The text to replace the image
            style: TextStyle(
              color: Colors.white, // Set text color to white
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () => logoutUser(context),
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ),
      ],
    );
  }

  // ✅ Search Bar Widget
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider(
      items: [
        // Image 1
        Image.asset('assets/images/offer3.png', fit: BoxFit.cover),
        // Image 2
        Image.asset('assets/images/offer2.png', fit: BoxFit.cover),
        // Image 3
        Image.asset('assets/images/offer1.jpg', fit: BoxFit.cover),
      ],
      options: CarouselOptions(
        height: 200, // Height of the carousel
        enlargeCenterPage: true, // Enlarge the center image
        autoPlay: true, // Auto-play the carousel
        aspectRatio: 16 / 9, // Aspect ratio of the images
        viewportFraction: 0.8, // Controls how much of the next image is visible
        scrollPhysics: const BouncingScrollPhysics(), // Smooth scrolling
      ),
    );
  }

  // ✅ Section Header
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              showAllCourses = !showAllCourses; // Toggle between show/hide
            });
          },
          child: Text(showAllCourses ? "SHOW LESS" : "SEE ALL"),
        ),
      ],
    );
  }

  // ✅ Popular Courses Section (GRID VIEW)
  Widget _buildPopularCourses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Popular Courses"),
        const SizedBox(height: 10),
        isLoading
            ? const Center(
                child: CircularProgressIndicator()) // Show loading state
            : GridView.builder(
                shrinkWrap: true,
                physics: showAllCourses
                    ? const ScrollPhysics() // Enable scrolling when expanded
                    : const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // ✅ Two courses per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // ✅ Adjusted for better layout
                ),
                itemCount: showAllCourses
                    ? popularCourses.length
                    : 2, // Show only 2 initially
                itemBuilder: (context, index) {
                  return _courseItem(popularCourses[index]);
                },
              ),
      ],
    );
  }

  // ✅ Course Card (Dynamically Loaded)
//   Widget _courseItem(dynamic course) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 getImageUrl(course["image"]),
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(course["title"] ?? "No title"),

//             Text(
//               "${course["price"] ?? "N/A"}/-",
//               style: const TextStyle(fontSize: 14, color: Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget _courseItem(dynamic course) {
    String formatPrice(dynamic price) {
      if (price == null) return "N/A";
      return "\$${NumberFormat("#,##0.00").format(price)}"; // Formats as $1,200.00
    }

    return Card(
      color: Colors.blue[50], // Light blue background color
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                getImageUrl(course["image"]),
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              course["title"] ?? "No title",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              formatPrice(course["price"]), // Formatted with `$`
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
