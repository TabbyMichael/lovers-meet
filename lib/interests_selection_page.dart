import 'package:flutter/material.dart';

class InterestsSelectionPage extends StatefulWidget {
  const InterestsSelectionPage({super.key});

  @override
  _InterestsSelectionPageState createState() => _InterestsSelectionPageState();
}

class _InterestsSelectionPageState extends State<InterestsSelectionPage> {
  // List of interests
  final List<String> _interests = [
    'Sports',
    'Music',
    'Travel',
    'Food',
    'Movies',
    'Reading',
    'Fitness',
    'Technology',
    'Fashion',
    'Gaming',
    'Art',
    'Nature',
    'Animals',
    'Photography',
    'Volunteering',
    'Cooking'
  ];

  // Tracks selected interests
  final List<String> _selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Interests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your interests to help us match you with the best suitors!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _interests.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_interests[index]),
                    value: _selectedInterests.contains(_interests[index]),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedInterests.add(_interests[index]);
                        } else {
                          _selectedInterests.remove(_interests[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to SwipeCardScreen when the button is pressed
                _submitInterests(context);
              },
              child: const Text('Confirm Selections'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitInterests(BuildContext context) {
    // Handle logic to save the selected interests
    // Here you can save them to your database or backend

    // For now, we'll navigate to the SwipeCardScreen
    Navigator.pushReplacementNamed(context, '/swipe');
  }
}
