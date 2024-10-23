import 'package:flutter/material.dart';
import 'package:lovers_meet/auth/auth_services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regex for validating email format
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              // Email TextField with validation
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: emailValidator,
              ),
              const SizedBox(height: 16.0),
              // Password TextField
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              // Confirm Password TextField
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Sign Up Button
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() == true) {
                    final authService = AuthService();
                    final user = await authService.signUpWithEmail(
                      emailController.text,
                      passwordController.text,
                    );
                    if (user != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/swipe');
                    } else {
                      // Show an error message
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign Up failed')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),
              // Social Signup Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone, size: 32),
                    onPressed: () {
                      // Handle phone signup
                      Navigator.pushNamed(context, '/phone_signup');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.mail,
                        size:
                            32), // Google icon (you can use a proper icon here)
                    onPressed: () {
                      // Handle Google signup
                      // Call your Google authentication method here
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.apple,
                        size:
                            32), // Apple icon (you can use a proper icon here)
                    onPressed: () {
                      // Handle Apple signup
                      // Call your Apple authentication method here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
