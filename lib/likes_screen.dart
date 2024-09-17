import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Welcome to Likes Screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
