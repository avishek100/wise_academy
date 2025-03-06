// import 'package:flutter/material.dart';

// import 'video_playback_screen.dart'; // ✅ Import video playback screen

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: const Text("Payment"), backgroundColor: Colors.blue),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Select Payment Method",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 20),
//             ListTile(
//               leading: const Icon(Icons.credit_card, color: Colors.blue),
//               title: const Text("Credit/Debit Card"),
//               onTap: () {
//                 // ✅ Navigate to Video Playback after payment
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const VideoPlaybackScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.paypal, color: Colors.blue),
//               title: const Text("PayPal"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const VideoPlaybackScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading:
//                   const Icon(Icons.account_balance_wallet, color: Colors.blue),
//               title: const Text("Google Pay"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const VideoPlaybackScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_learning/features/courses/presentation/view/fake_paypalscreen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Payment"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.paypal, color: Colors.blue),
              title: const Text("Pay with PayPal"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FakePayPalScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text("Credit/Debit Card"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FakePayPalScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
