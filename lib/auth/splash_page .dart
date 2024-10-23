import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/welcome');
    });

    return const Scaffold(
      backgroundColor:
          Color.fromARGB(255, 181, 49, 106), // Set background color to red
      body: Center(
        child: Text(
          ' lovers meet ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
      ),
    );
  }
}
