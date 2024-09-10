import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Email TextField with rounded border
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Border radius for TextField
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // Password TextField with rounded border
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Border radius for TextField
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // Confirm Password TextField with rounded border
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Border radius for TextField
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 30),
            // Sign Up Button with rounded corners
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/swipe');
              },
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.pink, // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Border radius for ElevatedButton
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
