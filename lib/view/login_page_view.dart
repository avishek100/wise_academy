import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class BusTicketScreen extends StatelessWidget {
  const BusTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5F9F2),

        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'BusTick',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.orange,
              ),
            ),
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Illustration Image
            Image.asset(
              'assets/bus_illustration.png', // Replace with your asset path
              height: 180,
            ),

            const SizedBox(height: 10),

            // Header Text
            const Text(
              'Get your ticket easily\nfrom BusTick!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Card Container
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // One Way / Round Trip Toggle Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'One Way',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Round Trip',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Input Fields
                    const InputField(
                      icon: Icons.flight_takeoff,
                      label: 'From',
                      value: 'Rangpur',
                    ),
                    const SizedBox(height: 15),
                    const InputField(
                      icon: Icons.place,
                      label: 'To',
                      value: 'Dhaka',
                    ),
                    const SizedBox(height: 15),
                    const InputField(
                      icon: Icons.calendar_today,
                      label: 'Date',
                      value: 'Monday, 19 January',
                    ),

                    const SizedBox(height: 25),

                    // Search Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'Search Any Bus',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
