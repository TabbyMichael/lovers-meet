import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'app_drawer.dart'; // Import your drawer widget

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  final TCardController _controller =
      TCardController(); // Define the TCardController
  final List<Map<String, String>> matches = [
    {
      'name': 'Charlie',
      'image':
          'assets/handsome-man-with-white-teeth-smiling-wearing-glasses-grey-wall.jpg',
    },
    {
      'name': 'Bob',
      'image':
          'assets/handsome-smiling-bald-middle-aged-man-with-beard-wearing-casual-white-t-shirt.jpg',
    },
    {'name': 'Alice', 'image': 'assets/profile.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Your Matches'),
        backgroundColor: Colors.pink,
      ),
      drawer: const AppDrawer(), // Add the drawer here
      body: TCard(
        controller: _controller, // Use the TCardController here
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.75), // Adjust size
        cards: matches.map((match) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      match['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    match['name']!,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onForward: (index, info) {
          print('Swiped forward on card index: $index');
        },
        onBack: (index, info) {
          print('Swiped back on card index: $index');
        },
        onEnd: () {
          print('You have reached the end of the cards.');
        },
      ),
    );
  }
}
