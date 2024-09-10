import 'package:flutter/material.dart';
import 'package:lovers_meet/PROFI/profile_detail_screen.dart';

class Matches extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {'name': 'Alice', 'image': 'assets/images/user1.jpg'},
    {'name': 'Bob', 'image': 'assets/images/user2.jpg'},
    {'name': 'Charlie', 'image': 'assets/images/user3.jpg'},
    // Add more matches here
  ];

  Matches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Matches'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final match = matches[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Border radius for Card
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(match['image']!), // User image
                ),
                title: Text(match['name']!), // User name
                contentPadding: const EdgeInsets.all(10.0),
                trailing:
                    const Icon(Icons.chat, color: Colors.pink), // Chat icon
                onTap: () {
                  // Navigate to the profile detail screen when a match is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileDetailScreen(
                        name: match['name']!,
                        image: match['image']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
