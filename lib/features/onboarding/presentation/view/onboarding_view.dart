// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:food_delivery_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';

// // class OnboardingView extends StatefulWidget {
// //   const OnboardingView({super.key});

// //   @override
// //   State<OnboardingView> createState() => _OnboardingScreenState();
// // }

// // class _OnboardingScreenState extends State<OnboardingView> {
// //   final PageController _pageController = PageController();
// //   int _currentPage = 0;

// //   final List<Map<String, String>> _onboardingData = [
// //     {
// //       "image": "assets/images/onboard1.png",
// //       "title": "Welcome",
// //       "description":
// //           "Your learning journey starts here. Unlock new skills, learn at your own pace, and grow with us!"
// //     },
// //     {
// //       "image": "assets/images/onboard2.png",
// //       "title": "Start Learning with Wise Academy",
// //       "description":
// //           "Explore a world of knowledge and take control of your learning path today!"
// //     },
// //     {
// //       "image": "assets/images/onboard3.png",
// //       "title": "Learn Anytime, Anywhere",
// //       "description":
// //           "Join Wise Academy and access personalized courses to help you succeed, on your terms."
// //     },
// //   ];

// //   void _goToLoginPage(BuildContext context) {
// //     context.read<OnboardingCubit>().init(context);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             // PageView Section
// //             Expanded(
// //               child: PageView.builder(
// //                 controller: _pageController,
// //                 onPageChanged: (index) {
// //                   setState(() {
// //                     _currentPage = index;
// //                   });
// //                 },
// //                 itemCount: _onboardingData.length,
// //                 itemBuilder: (context, index) {
// //                   return _buildOnboardingPage(
// //                     image: _onboardingData[index]['image']!,
// //                     title: _onboardingData[index]['title']!,
// //                     description: _onboardingData[index]['description']!,
// //                   );
// //                 },
// //               ),
// //             ),
// //             // Progress Dots and Navigation
// //             _buildBottomSection(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildOnboardingPage({
// //     required String image,
// //     required String title,
// //     required String description,
// //   }) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       children: [
// //         // Circular background and image
// //         Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Container(
// //               height: 250,
// //               width: 250,
// //               decoration: BoxDecoration(
// //                 color: Colors.deepPurple.shade50,
// //                 shape: BoxShape.circle,
// //               ),
// //             ),
// //             Image.asset(
// //               image,
// //               height: 220,
// //               width: 220,
// //               fit: BoxFit.contain,
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 20),
// //         // Title
// //         Text(
// //           title,
// //           textAlign: TextAlign.center,
// //           style: const TextStyle(
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.black,
// //           ),
// //         ),
// //         // Description
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 24),
// //           child: Text(
// //             description,
// //             textAlign: TextAlign.center,
// //             style: const TextStyle(
// //               fontSize: 16,
// //               color: Colors.grey,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // Bottom Section for Progress and Button
// //   Widget _buildBottomSection() {
// //     return Padding(
// //       padding: const EdgeInsets.all(20.0),
// //       child: Column(
// //         children: [
// //           // Progress Indicator Dots
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: List.generate(
// //               _onboardingData.length,
// //               (index) => _buildDot(index),
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           // Navigation Button
// //           SizedBox(
// //             width: double.infinity,
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 if (_currentPage == _onboardingData.length - 1) {
// //                   context.read<OnboardingCubit>().init(context);
// //                 } else {
// //                   _pageController.nextPage(
// //                     duration: const Duration(milliseconds: 300),
// //                     curve: Curves.ease,
// //                   );
// //                 }
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 padding: const EdgeInsets.symmetric(vertical: 14),
// //               ),
// //               child: Text(
// //                 _currentPage == _onboardingData.length - 1
// //                     ? "Get Started"
// //                     : "Next",
// //                 style: const TextStyle(fontSize: 18, color: Colors.white),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           // Skip Button
// //           TextButton(
// //             onPressed: () => _goToLoginPage(context),
// //             child: const Text(
// //               "Skip",
// //               style: TextStyle(
// //                 fontSize: 16,
// //                 color: Colors.grey,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // Helper Widget: Progress Dots
// //   Widget _buildDot(int index) {
// //     return AnimatedContainer(
// //       duration: const Duration(milliseconds: 300),
// //       margin: const EdgeInsets.symmetric(horizontal: 5),
// //       height: 8,
// //       width: _currentPage == index ? 20 : 8,
// //       decoration: BoxDecoration(
// //         color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
// //         borderRadius: BorderRadius.circular(4),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_delivery_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';

// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingView> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<Map<String, String>> _onboardingData = [
//     {
//       "image": "assets/images/onboard1.png",
//       "title": "Welcome",
//       "description":
//           "Your learning journey starts here. Unlock new skills, learn at your own pace, and grow with us!"
//     },
//     {
//       "image": "assets/images/onboard2.png",
//       "title": "Start Learning with Wise Academy",
//       "description":
//           "Explore a world of knowledge and take control of your learning path today!"
//     },
//     {
//       "image": "assets/images/onboard3.png",
//       "title": "Learn Anytime, Anywhere",
//       "description":
//           "Join Wise Academy and access personalized courses to help you succeed, on your terms."
//     },
//   ];

//   void _goToLoginPage(BuildContext context) {
//     context.read<OnboardingCubit>().init(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Set the background color to white
//       body: SafeArea(
//         child: Column(
//           children: [
//             // PageView Section
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemCount: _onboardingData.length,
//                 itemBuilder: (context, index) {
//                   return _buildOnboardingPage(
//                     image: _onboardingData[index]['image']!,
//                     title: _onboardingData[index]['title']!,
//                     description: _onboardingData[index]['description']!,
//                   );
//                 },
//               ),
//             ),
//             // Progress Dots and Navigation
//             _buildBottomSection(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOnboardingPage({
//     required String image,
//     required String title,
//     required String description,
//   }) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Circular background and image
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               height: 250,
//               width: 250,
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple.shade50,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             Image.asset(
//               image,
//               height: 220,
//               width: 220,
//               fit: BoxFit.contain,
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         // Title
//         Text(
//           title,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         // Description
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Text(
//             description,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Bottom Section for Progress and Button
//   Widget _buildBottomSection() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           // Progress Indicator Dots
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               _onboardingData.length,
//               (index) => _buildDot(index),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Navigation Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_currentPage == _onboardingData.length - 1) {
//                   context.read<OnboardingCubit>().init(context);
//                 } else {
//                   _pageController.nextPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.ease,
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 backgroundColor: Colors.blue, // Change button color to blue
//               ),
//               child: Text(
//                 _currentPage == _onboardingData.length - 1
//                     ? "Get Started"
//                     : "Next",
//                 style: const TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Skip Button
//           TextButton(
//             onPressed: () => _goToLoginPage(context),
//             child: const Text(
//               "Skip",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper Widget: Progress Dots
//   Widget _buildDot(int index) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       height: 8,
//       width: _currentPage == index ? 20 : 8,
//       decoration: BoxDecoration(
//         color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
//         borderRadius: BorderRadius.circular(4),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/onboarding_cubit.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboard1.png",
      "title": "Welcome",
      "description":
          "Your learning journey starts here. Unlock new skills, learn at your own pace, and grow with us!"
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Start Learning with Wise Academy",
      "description":
          "Explore a world of knowledge and take control of your learning path today!"
    },
    {
      "image": "assets/images/onboard3.png",
      "title": "Learn Anytime, Anywhere",
      "description":
          "Join Wise Academy and access personalized courses to help you succeed, on your terms."
    },
  ];

  void _goToLoginPage(BuildContext context) {
    context.read<OnboardingCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(
                    image: _onboardingData[index]['image']!,
                    title: _onboardingData[index]['title']!,
                    description: _onboardingData[index]['description']!,
                  );
                },
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              // decoration: BoxDecoration(
              //   color: Colors.deepPurple.shade50,
              //   shape: BoxShape.circle,
              // ),
            ),
            Image.asset(
              image,
              height: 220,
              width: 220,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => _buildDot(index),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == _onboardingData.length - 1) {
                  context.read<OnboardingCubit>().init(context);
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                _currentPage == _onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => _goToLoginPage(context),
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
