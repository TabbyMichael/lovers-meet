import 'package:flutter/material.dart';
import 'package:lovers_meet/api%20.dart';
import 'package:tcard/tcard.dart';
import 'api_service.dart'; // Ensure your RandomUserService is implemented correctly

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({Key? key}) : super(key: key);

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  final TCardController _controller = TCardController();
  List<Map<String, dynamic>> matches = []; // Changed to dynamic
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchRandomUsers(); // Fetch the users when the screen initializes
  }

  // This function fetches random users using the RandomUserService
  Future<void> _fetchRandomUsers() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    RandomUserService userService = RandomUserService();

    try {
      // Fetch random users with a count of 10
      final randomUsers = await userService.fetchRandomUsers(count: 10);

      setState(() {
        // Mapping the fetched user data to a format we can use in the UI
        matches = randomUsers.map((user) {
          final firstName = user['name']?['first'] ?? 'Unknown';
          final lastName = user['name']?['last'] ?? 'User';
          final imageUrl = user['picture']?['large'] ??
              'https://via.placeholder.com/150'; // Fallback image if picture is null

          return {
            'name': '$firstName $lastName',
            'image': imageUrl,
          };
        }).toList();
        _isLoading = false; // Stop the loading state
      });
    } catch (e) {
      print('Error fetching random users: $e');
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Your Matches'),
        backgroundColor: Colors.pink,
      ),
      body: _isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while fetching data
          : _hasError
              ? const Center(
                  child: Text(
                    'Error fetching matches. Please try again later.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : matches.isNotEmpty
                  ? TCard(
                      controller: _controller,
                      size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.75,
                      ),
                      cards: matches.map((match) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5.0,
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    match['image'] as String, // Cast to String
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        'https://via.placeholder.com/150',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ); // Placeholder if image fails to load
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  match['name'] as String, // Cast to String
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
                    )
                  : const Center(
                      child: Text(
                        'No matches found. Please try again later.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
    );
  }
}
