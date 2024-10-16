import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String userId; // Pass userId to update profile

  const ProfileDetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.userId,
  });

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _imageController.text = widget.image;
  }

  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });

    final name = _nameController.text.trim();
    final image = _imageController.text.trim();

    try {
      final response = await http.put(
        Uri.parse('https://api.pixel.com/users/${widget.userId}'),
        headers: {
          'Authorization':
              'Bearer Dye0BwW0bQoVH2XNAydM6blZ38TydAb3oBclBCKO734fzXCTf8lcsOTh', // Replace with your actual API key
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'image': image,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.of(context).pop();
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      // Handle error
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              backgroundImage: NetworkImage(
                  _imageController.text), // Use NetworkImage for online images
              radius: 80,
            ),
            const SizedBox(height: 20),

            // User ID Display
            Text(
              'User ID: ${widget.userId}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),

            // Name Input
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),

            // Profile Image URL Input
            TextFormField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Profile Image URL'),
            ),
            const SizedBox(height: 20),

            // Update Profile Button
            ElevatedButton(
              onPressed: _loading ? null : _updateProfile,
              child: Text(_loading ? 'Updating...' : 'Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
