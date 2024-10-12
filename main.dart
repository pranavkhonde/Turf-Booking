import 'package:flutter/material.dart';

void main() {
  runApp(const BookMyGround());
}

class BookMyGround extends StatelessWidget {
  const BookMyGround({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMyGround'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Background Image with error handling
          Image.network(
            'https://plus.unsplash.com/premium_photo-1684888778856-c6f2795e3c14?fm=jpg&q=80',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return Center(child: Text('Failed to load image', style: TextStyle(color: Colors.red)));
            },
          ),
          // Overlay for content
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a facility...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    FacilityCard(facilityName: 'Football Turf', availability: 'Available'),
                    FacilityCard(facilityName: 'Cricket Ground', availability: 'Unavailable'),
                    FacilityCard(facilityName: 'Basketball Court', availability: 'Available'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String facilityName;
  final String availability;

  const FacilityCard({super.key, required this.facilityName, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(facilityName),
        subtitle: Text('Availability: $availability'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to AvailableGroundsScreen when a facility is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AvailableGroundsScreen(facilityName: facilityName),
            ),
          );
        },
      ),
    );
  }
}

// Define the AvailableGroundsScreen class here
class AvailableGroundsScreen extends StatelessWidget {
  final String facilityName;

  const AvailableGroundsScreen({super.key, required this.facilityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$facilityName Availability'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details for $facilityName:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Here you can book your ground!', style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () {
                // Action to book the ground (placeholder)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Booking Confirmation'),
                    content: Text('You have booked the $facilityName!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

1st wala code