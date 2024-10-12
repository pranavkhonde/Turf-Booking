import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: FacilityDetailsScreen(
        facilityName: 'Sports Complex',
        availability: 'Available',
      ),
    );
  }
}

class FacilityDetailsScreen extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityDetailsScreen({super.key, required this.facilityName, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facilityName),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://images.unsplash.com/photo-1517927033932-b3d18e61fb3a?fm=jpg&q=60',
            fit: BoxFit.cover, // Cover the entire screen
            height: double.infinity,
            width: double.infinity,
          ),
          // Content over the background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Availability: $availability',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Available Slots:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: const [
                      SlotCard(time: '8:00 AM - 9:00 AM', isAvailable: true),
                      SlotCard(time: '9:00 AM - 10:00 AM', isAvailable: false),
                      SlotCard(time: '10:00 AM - 11:00 AM', isAvailable: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  final String time;
  final bool isAvailable;

  const SlotCard({super.key, required this.time, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isAvailable ? Colors.green[100] : Colors.grey[300],
      child: ListTile(
        title: Text(time),
        trailing: isAvailable
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red),
        onTap: isAvailable
            ? () {
                // Show a dialog for booking confirmation
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm Booking'),
                      content: Text('Do you want to book the slot at $time?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingConfirmationScreen(time: time),
                              ),
                            );
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              }
            : null,
      ),
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
        title: const Text('Booking Confirmation'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'You have successfully booked the slot at $time!',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}