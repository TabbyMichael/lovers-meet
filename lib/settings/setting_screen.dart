import 'package:flutter/material.dart';
import 'package:lovers_meet/settings/about_section_screen.dart';
import 'package:lovers_meet/auth/ogout_screen.dart';
import 'package:lovers_meet/settings/privacy_screen.dart';
import 'package:lovers_meet/settings/terms_of_service_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationsEnabled = true; // Notifications switch state
  bool _isDarkModeEnabled = false; // Dark mode switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
      ),
      body: ListView(
        children: [
          // Account Settings
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/account_settings');
            },
          ),

          // Notifications
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: _isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationsEnabled = value;
                });
              },
            ),
          ),

          // Privacy
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              // Navigate to PrivacyScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyScreen()),
              );
            },
          ),

          // Dark Mode
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
            ),
          ),

          // Language
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Handle language change
            },
          ),

          // About Us
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AboutSectionScreen()),
              );
            },
          ),

          // Terms & Privacy Policy
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms & Privacy Policy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TermsOfServiceScreen()),
              );
            },
          ),

          // Logout
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
