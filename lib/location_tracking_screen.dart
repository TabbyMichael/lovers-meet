import 'package:flutter/material.dart';

class LocationTrackingScreen extends StatelessWidget {
  const LocationTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracking'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
            'Location Tracking Settings Here'), // Replace with actual settings
      ),
    );
  }
}
