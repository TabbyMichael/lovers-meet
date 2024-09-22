import 'package:flutter/material.dart';

class AdPersonalizationScreen extends StatelessWidget {
  const AdPersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Personalization'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
            'Ad Personalization Settings Here'), // Replace with actual settings
      ),
    );
  }
}
