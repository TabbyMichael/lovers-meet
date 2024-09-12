import 'package:flutter/material.dart';
import 'package:lovers_meet/privacy_policy_screen.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isDataSharingEnabled = true;
  bool _isLocationTrackingEnabled = true;
  bool _isAdPersonalizationEnabled = true;
  bool _isProfileVisibilityEnabled = true;

  void _updateDataSharing(bool value) {
    setState(() {
      _isDataSharingEnabled = value;
    });
  }

  void _updateLocationTracking(bool value) {
    setState(() {
      _isLocationTrackingEnabled = value;
    });
  }

  void _updateAdPersonalization(bool value) {
    setState(() {
      _isAdPersonalizationEnabled = value;
    });
  }

  void _updateProfileVisibility(bool value) {
    setState(() {
      _isProfileVisibilityEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          // Data Sharing Permissions
          SwitchListTile(
            title: const Text('Data Sharing'),
            subtitle:
                const Text('Allow app to share your data with third parties.'),
            value: _isDataSharingEnabled,
            onChanged: _updateDataSharing,
          ),

          // Location Tracking
          SwitchListTile(
            title: const Text('Location Tracking'),
            subtitle: const Text(
                'Allow app to track your location for better services.'),
            value: _isLocationTrackingEnabled,
            onChanged: _updateLocationTracking,
          ),

          // Ad Personalization
          SwitchListTile(
            title: const Text('Ad Personalization'),
            subtitle: const Text(
                'Allow app to show personalized ads based on your usage.'),
            value: _isAdPersonalizationEnabled,
            onChanged: _updateAdPersonalization,
          ),

          // Profile Visibility
          SwitchListTile(
            title: const Text('Profile Visibility'),
            subtitle: const Text('Make your profile visible to other users.'),
            value: _isProfileVisibilityEnabled,
            onChanged: _updateProfileVisibility,
          ),

          // Privacy Policy Link
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),

          // Request Data Button
          ListTile(
            leading: const Icon(Icons.cloud_download),
            title: const Text('Request Your Data'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Request Data'),
                    content: const Text(
                        'Requesting your data is under development.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          // Delete Account
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Account'),
                    content: const Text(
                        'Are you sure you want to delete your account? This action is irreversible.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cancel deletion
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle actual account deletion here
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
