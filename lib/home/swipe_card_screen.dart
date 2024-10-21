import 'package:flutter/material.dart';
import 'package:lovers_meet/API/api%20.dart';
import 'package:lovers_meet/home/bottom_navigationbar.dart';
import 'package:tcard/tcard.dart';
import 'package:lovers_meet/home/app_drawer.dart';
import 'package:lovers_meet/likes_screen.dart';
import 'package:lovers_meet/home/chat_screen.dart';
import 'package:lovers_meet/settings/account_settings_screen.dart';

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  final TCardController _controller = TCardController();
  List<Map<String, dynamic>> _matches = [];
  bool _isLoading = true;
  bool _hasError = false;
  final PexelsImageService _pexelsApiService = PexelsImageService();

  int _currentIndex = 0; // Current index of the bottom navigation

  final List<Widget> _screens = [
    const LikesScreen(),
    const ChatScreen(),
    const AccountSettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _fetchImages(); // Fetch images when the screen initializes
  }

  Future<void> _fetchImages() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Fetch profile-like images with a query and count
      final images =
          await _pexelsApiService.fetchImages(query: 'portrait', count: 100);

      // Define separate lists of names for men and women
      List<String> maleNames = [
        "John",
        "Michael",
        "Ethan",
        "George",
        "David",
        "James",
        "Robert",
        "Daniel",
        "Matthew",
        "Chris",
      ];

      List<String> femaleNames = [
        "Alice",
        "Emma",
        "Sophia",
        "Olivia",
        "Liam",
        "Ava",
        "Isabella",
        "Mia",
        "Charlotte",
        "Amelia",
      ];

      setState(() {
        _matches = images
            .asMap()
            .map((index, image) {
              final imageUrl = image['src']['medium'] ??
                  'https://via.placeholder.com/150'; // Fallback image if URL is null

              // Use modulo to alternate between male and female names
              String name;
              num age = 20 + (index % 10); // Example: Ages from 20 to 29
              if (index % 2 == 0) {
                name =
                    maleNames[index ~/ 2 % maleNames.length]; // Use male names
              } else {
                name = femaleNames[
                    index ~/ 2 % femaleNames.length]; // Use female names
              }

              return MapEntry(index, {
                'name': name, // Set name directly from the names list
                'age': age, // Age stored separately
                'image': imageUrl,
              });
            })
            .values
            .toList(); // Convert to list
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching images: $e');
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onAddButtonPressed() {
    // Handle the add button action here
    print("Add button pressed");
    // You can navigate to a new screen or show a dialog, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Your Matches'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.menu), // Burger menu icon
          onPressed: () {
            Navigator.pushNamed(context, '/app_drawer');
          },
        ),
      ),
      drawer: const AppDrawer(), // Adding the drawer here
      body: _isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while fetching data
            )
          : _hasError
              ? const Center(
                  child: Text(
                    'Error fetching matches. Please try again later.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : _matches.isNotEmpty
                  ? Stack(
                      children: [
                        TCard(
                          controller: _controller,
                          size: Size(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height * 0.75,
                          ),
                          cards: _matches.map((match) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 5.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      match['image'] as String,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.network(
                                          'https://via.placeholder.com/150',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ); // Placeholder if image fails to load
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.5),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          '${match['name']} (${match['age']})', // Display name and age
                                          style: const TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
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
                      ],
                    )
                  : const Center(
                      child: Text(
                        'No matches found. Please try again later.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onBottomNavTapped,
        onAddButtonPressed: _onAddButtonPressed, // Pass the callback here
      ),
    );
  }
}
