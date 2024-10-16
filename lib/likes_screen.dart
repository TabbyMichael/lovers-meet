import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
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
