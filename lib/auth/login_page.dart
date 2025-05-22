import 'package:flutter/material.dart';
import 'package:lovers_meet/auth/auth_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              // Email TextField
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
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
              const SizedBox(height: 30),
              // Login Button
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() == true) {
                    final authService = AuthService();
                    final user = await authService.signInWithEmail(
                      emailController.text,
                      passwordController.text,
                    );
                    if (user != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, '/swipe');
                    } else {
                      // Show an error message
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login failed')),
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
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              // Social Login Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone, size: 32),
                    onPressed: () {
                      Navigator.pushNamed(context, '/phone_auth');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.mail,
                        size:
                            32), // Google icon (you can replace with proper icon)
                    onPressed: () async {
                      final authService = AuthService();
                      final user = await authService
                          .signInWithGoogle(); // Call Google sign-in method
                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, '/swipe');
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Google sign-in failed')),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.apple,
                        size: 32), // Apple icon (replace with proper icon)
                    onPressed: () {
                      // Placeholder for Apple sign-in
                      // You will need to implement Apple sign-in (e.g., using sign_in_with_apple package)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Apple login not yet implemented')),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Navigate to Sign Up Page
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                ),
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
