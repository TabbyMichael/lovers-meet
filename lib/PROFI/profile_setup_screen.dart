import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatelessWidget {
  // Sample data for matches
  final List<Map<String, String>> matches = [
    {'name': 'Alice', 'image': 'assets/images/user1.jpg'},
    {'name': 'Bob', 'image': 'assets/images/user2.jpg'},
    {'name': 'Charlie', 'image': 'assets/images/user3.jpg'},
    {'name': 'David', 'image': 'assets/images/user4.jpg'},
    // Add more matches here
  ];

  // Sample data for additional pictures
  final List<String> additionalPictures = [
    'assets/handsome-man-with-white-teeth-smiling-wearing-glasses-grey-wall.jpg',
    'assets/handsome-smiling-bald-middle-aged-man-with-beard-wearing-casual-white-t-shirt.jpg',
    'assets/profile.jpg',
    "assets/user.jpg",

    // Add more pictures here if needed
  ];

  ProfileSetupScreen({super.key});

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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/user.jpg'), // Placeholder image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Age: 25',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                'Gender: Female',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text('Bio: Love to travel and explore new places.',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('View Matches'),
              ),
              const SizedBox(height: 20),
              // Grid of matches (pictures only)

              const SizedBox(height: 20),
              // Grid of additional pictures (pictures only)
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns for pictures
                  crossAxisSpacing: 10.0, // Space between columns
                  mainAxisSpacing: 10.0, // Space between rows
                  childAspectRatio: 3 / 2, // Rectangular aspect ratio
                ),
                itemCount: additionalPictures.length,
                itemBuilder: (context, index) {
                  final picture = additionalPictures[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10.0), // Border radius
                      image: DecorationImage(
                        image: AssetImage(picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
