// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            // Dashboard Items
            DashboardCard(
              title: 'Profile',
              icon: Icons.person,
              color: Colors.blue,
              onTap: () {
                // Navigate to Profile Page
                print('Profile Tapped');
              },
            ),
            DashboardCard(
              title: 'Orders',
              icon: Icons.shopping_cart,
              color: Colors.green,
              onTap: () {
                // Navigate to Orders Page
                print('Orders Tapped');
              },
            ),
            DashboardCard(
              title: 'Notifications',
              icon: Icons.notifications,
              color: Colors.orange,
              onTap: () {
                // Navigate to Notifications Page
                print('Notifications Tapped');
              },
            ),
            DashboardCard(
              title: 'Settings',
              icon: Icons.settings,
              color: Colors.purple,
              onTap: () {
                // Navigate to Settings Page
                print('Settings Tapped');
              },
            ),
            DashboardCard(
              title: 'Help',
              icon: Icons.help,
              color: Colors.red,
              onTap: () {
                // Navigate to Help Page
                print('Help Tapped');
              },
            ),
            DashboardCard(
              title: 'Logout',
              icon: Icons.logout,
              color: Colors.teal,
              onTap: () {
                // Logout Functionality
                print('Logout Tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
