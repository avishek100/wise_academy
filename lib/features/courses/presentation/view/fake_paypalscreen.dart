// import 'package:e_learning/features/courses/presentation/view/video_playback_screen.dart';
// import 'package:flutter/material.dart';

// class FakePayPalScreen extends StatelessWidget {
//   const FakePayPalScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("PayPal Checkout"), backgroundColor: Colors.blue),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "PayPal Checkout",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Pay \$10.00 for the course",
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 40),

//             // ✅ Pay Now Button (Success)
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const VideoPlaybackScreen()),
//                   );
//                 },
//                 child: const Text(
//                   "Pay Now",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // ❌ Cancel Payment Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                 onPressed: () {
//                   Navigator.pop(context); // Go back to PaymentScreen
//                 },
//                 child: const Text(
//                   "Cancel Payment",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_learning/features/courses/presentation/view/video_playback_screen.dart';
import 'package:flutter/material.dart';

class FakePayPalScreen extends StatelessWidget {
  const FakePayPalScreen({super.key});

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 16)),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("PayPal Checkout"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Checkout",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pay \$50.00 for the course",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),

            // ✅ Pay Now Button (Success)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  _showSnackbar(context, "Payment Successful! ✅", Colors.green);

                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoPlaybackScreen()),
                    );
                  });
                },
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ❌ Cancel Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  _showSnackbar(context, "Payment Cancelled ❌", Colors.red);

                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  "Cancel Payment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
