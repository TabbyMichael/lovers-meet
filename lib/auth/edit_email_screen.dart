import 'package:flutter/material.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  _EditEmailScreenState createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text =
        'current.email@example.com'; // Replace with actual email
  }

  void _saveEmail() {
    // Implement save functionality here
    // Update the email in your database or state management solution
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'New Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEmail,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
