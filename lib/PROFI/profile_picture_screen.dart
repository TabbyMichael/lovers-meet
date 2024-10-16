import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({super.key});

  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? _profileImage; // Variable to store the selected image

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to take a photo using the camera
  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Profile Picture'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the current profile picture or a placeholder
            CircleAvatar(
              radius: 60,
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : const NetworkImage(
                      'https://via.placeholder.com/150'), // Placeholder or user's current profile pic URL
            ),
            const SizedBox(height: 16),
            // Display user's name and email (or other info)
            Text(
              'User Name', // You can replace this with the actual user's name
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'user@example.com', // Replace with actual user email
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            // Options to select from gallery or take a photo
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo_library),
              label: const Text('Select from Gallery'),
            ),
            ElevatedButton.icon(
              onPressed: _takePhoto,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Take a Photo'),
            ),
            const SizedBox(height: 20),
            // Optional: Button to save or upload the new profile picture
            ElevatedButton(
              onPressed: () {
                // Add logic to save the profile picture
                // For example, upload to a server or save locally
              },
              child: const Text('Save Profile Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
