import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  final VoidCallback onLogout;

  LogoutScreen({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the onLogout callback to handle logout logic
            onLogout();
            // Navigate to the Login Screen
            Navigator.pushReplacementNamed(
                context, '/login'); // Adjust the route name as needed
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
