import 'package:flutter/material.dart';
import 'package:lovers_meet/settings/account_settings_screen.dart';
import 'package:lovers_meet/home/chat_screen.dart';
import 'package:lovers_meet/home/swipe_card_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onAddButtonPressed;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onAddButtonPressed,
  });

  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SwipeCardScreen()),
        );
        break;
      // case 1:
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => FriendsScreen()),
      //   );
      //   break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const AccountSettingsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomNavigationBar(
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
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            if (index == 2) {
              onAddButtonPressed();
            } else {
              onItemTapped(index);
              _navigateToPage(index, context); // Navigate to the selected page
            }
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
        ),
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            onPressed: onAddButtonPressed,
            backgroundColor: const Color.fromARGB(255, 209, 40, 107),
            child: const Icon(
              Icons.add,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
