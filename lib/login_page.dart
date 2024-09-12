import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    vertical: 10.0, horizontal: 10.0),
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
            const SizedBox(height: 30),
            // Login Button with rounded corners
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                Navigator.pushNamed(context, '/home');
              },
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
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            // Navigate to Sign Up Page
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink, // Text color
              ),
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
