import 'package:flutter/material.dart';

class ProfileVisibilityScreen extends StatelessWidget {
  const ProfileVisibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Visibility'),
        backgroundColor: Colors.pink,
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: const Text(
            'Profile Visibility Settings Here'), // Replace with actual settings
      ),
    );
  }
}
