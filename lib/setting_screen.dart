import 'package:flutter/material.dart';
import 'package:lovers_meet/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
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
        title: const Text('Settings'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          // Account Settings
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account Settings'),
            onTap: () {
              // Navigate to account settings screen
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
              // Show about us information
            },
          ),

          // Terms & Privacy Policy
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms & Privacy Policy'),
            onTap: () {
              // Navigate to terms and privacy policy
            },
          ),

          // Logout
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
    );
  }
}
