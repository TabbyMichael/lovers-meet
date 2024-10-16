import 'dart:io'; // Import for handling files
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for picking images
import 'package:lovers_meet/auth/Edit_Username_Screen.dart';
import '../auth/edit_email_screen.dart';
import '../auth/edit_password_screen.dart';
import '../profi/profile_picture_screen.dart'; // Import the profile picture screen

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  File? _profileImage; // Variable to store the selected image
// Image picker instance

  // Method to pick an image from the gallery

  // Method to take a photo with the camera

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePictureScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      child: _profileImage == null
                          ? const Icon(Icons.account_circle,
                              size: 100, color: Colors.blueGrey)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePictureScreen(),
                        ),
                      );
                    },
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Username Section
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Username'),
              subtitle:
                  const Text('CurrentUsername'), // Replace with actual username
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditUsernameScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Email Section
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text(
                  'current.email@example.com'), // Replace with actual email
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditEmailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Password Section
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Password'),
              subtitle: const Text('**********'), // Hide password for security
              trailing: const Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditPasswordScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/logout'); // Adjust the route as needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red color for logout button
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
