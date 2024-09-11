import 'package:flutter/material.dart';
import 'package:lovers_meet/about_section_screen.dart';
import 'package:lovers_meet/ogout_screen.dart';
import 'package:lovers_meet/setting_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          // Home Tile
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/swipe');
            },
          ),
          // Terms of Service Tile
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Terms of Service'),
            onTap: () {
              Navigator.pushNamed(
                  context, '/terms'); // Navigate to Terms of Service page
            },
          ),
          // Privacy Policy Tile
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pushNamed(
                  context, '/privacy'); // Navigate to Privacy Policy page
            },
          ),
          // Settings Tile
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          // About Tile
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutSectionScreen()),
              );
            },
          ),
          // Logout Tile
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogoutScreen(
                    onLogout: () {
                      // Handle logout logic here
                      print('User logged out');
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
