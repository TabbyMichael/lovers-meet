import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mockUsers = [
    {
      'name': 'Alex',
      'location': 'New York',
      'image': 'assets/user.jpg',
    },
    {
      'name': 'Jamie',
      'location': 'Los Angeles',
      'image': 'assets/profile.jpg',
    },
    {
      'name': 'Taylor',
      'location': 'Chicago',
      'image': 'assets/edmond.jpeg',
    },
    {
      'name': 'Jordan',
      'location': 'Miami',
      'image':
          'assets/handsome-man-with-white-teeth-smiling-wearing-glasses-grey-wall.jpg',
    },
    {
      'name': 'Casey',
      'location': 'Seattle',
      'image':
          'assets/handsome-smiling-bald-middle-aged-man-with-beard-wearing-casual-white-t-shirt.jpg',
    },
  ];
  LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/swipe');
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: mockUsers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(mockUsers[index]['image']),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ${index + 1}', // Replace with actual username
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Location ${index + 1}', // Replace with actual location
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // TODO: Handle like action
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
