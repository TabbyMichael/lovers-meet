import 'package:flutter/material.dart';

class DataSharingScreen extends StatelessWidget {
  const DataSharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Sharing'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child:
            Text('Data Sharing Settings Here'), // Replace with actual settings
      ),
    );
  }
}
