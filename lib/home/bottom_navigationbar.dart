import 'package:flutter/material.dart';
import 'package:lovers_meet/auth/Edit_Username_Screen.dart';
import 'package:lovers_meet/home/chat_screen.dart';
import 'package:lovers_meet/likes_screen.dart';
import 'package:lovers_meet/settings/account_settings_screen.dart';
import 'package:lovers_meet/home/swipe_card_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required void Function() onAddButtonPressed,
  });

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SwipeCardScreen()),
        );
        break;
      case 1: // Likes case
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LikesScreen()),
        );
        break;
      case 2: // Inbox case
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
        break;
      case 3: // Profile case
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AccountSettingsScreen()),
        ).then((_) {
          // When back button is pressed, navigate to swipe screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SwipeCardScreen()),
          );
        });
        break;
      case 4: // Edit Username case
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditUsernameScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit), // Icon for editing username
          label: 'Edit Username',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        onItemTapped(index);
        _navigateToPage(index, context); // Navigate to the selected page
      },
      backgroundColor: const Color.fromRGBO(233, 30, 99, 1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
