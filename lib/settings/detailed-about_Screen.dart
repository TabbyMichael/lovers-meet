// ignore: file_names
import 'package:flutter/material.dart';
import 'detailed_about_screen.dart'; // Import the Detailed About screen

class AboutSectionScreen extends StatelessWidget {
  const AboutSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This app is designed to provide a great user experience by allowing users to manage tasks, chat with friends, and access various services easily. It has been built with modern technologies to ensure security and reliability.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Developers:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Adrian Doe - Lead Developer\n2. Jane Smith - UI/UX Designer\n3. John Doe - Backend Developer',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Legal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This app complies with all legal requirements and adheres to data privacy standards. All user data is securely stored and processed in accordance with our privacy policy.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailedAboutScreen()),
                );
              },
              child: const Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Makes it look clickable
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: support@appname.com\nPhone: +1 (234) 567-8901',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
