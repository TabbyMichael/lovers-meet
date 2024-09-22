import 'package:flutter/material.dart';
import 'package:lovers_meet/API/api%20.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = PexelsImageService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: userService.fetchImages(
            count: 10, query: ''), // Ensure this method exists
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['src']),
                ),
                title: Text(user['photographer']),
              );
            },
          );
        },
      ),
    );
  }
}
