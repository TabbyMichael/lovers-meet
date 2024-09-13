import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For handling the file picked

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  File? _image; // Store the picked image file
  String username = 'User Name'; // Placeholder for the username
  String bio = 'Love to travel and explore new places.'; // Placeholder for bio

  final picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Here you would upload the file to Firebase or any other backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage, // Trigger the image picker
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? const AssetImage('assets/user.jpg') // Placeholder image
                      : FileImage(_image!) as ImageProvider,
                ),
              ),
              const SizedBox(height: 20),

              // Username field
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                controller: TextEditingController(text: username),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Bio field
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                ),
                controller: TextEditingController(text: bio),
                onChanged: (value) {
                  setState(() {
                    bio = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Save the updated profile data to the backend (e.g., Firebase)
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('Save Changes'),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('View Matches'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
