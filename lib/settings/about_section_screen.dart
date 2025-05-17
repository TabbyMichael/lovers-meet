import 'package:flutter/material.dart';

class AboutSectionScreen extends StatelessWidget {
  const AboutSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name
            Text(
              'App Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // App Description
            Text(
              'This app is designed to provide a great user experience by allowing users to manage tasks, chat with friends, and access various services easily. It has been built with modern technologies to ensure security and reliability.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Version Info
            Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),

            // Developer Info
            Text(
              'Developers:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Tabitha michael - Lead Developer\n2. Ian kamau - UI/UX Designer\n3. Theo javi - Backend Developer',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Legal Information (Optional)
            Text(
              'Legal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This app complies with all legal requirements and adheres to data privacy standards. All user data is securely stored and processed in accordance with our privacy policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Contact Information
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: support@appname.com\nPhone: +1 (234) 567-8901',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
