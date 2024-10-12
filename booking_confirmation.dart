import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Remove the debug banner
      home: BookingConfirmationScreen(time: '2:00 PM'),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  final String time;

  const BookingConfirmationScreen({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?q=80&w=870', // Updated Background image URL
            ),
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              Text(
                'Your slot at $time has been successfully booked!',
                style: const TextStyle(fontSize: 18, color: Colors.white), // Change text color for better visibility
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to Facility Details
                },
                child: const Text('Back to Facility'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}