import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 100),
            const SizedBox(height: 20),
            const Text("User Name", style: TextStyle(fontSize: 20)),
            const Text("user@example.com",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Edit Profile")),
            ElevatedButton(onPressed: () {}, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
