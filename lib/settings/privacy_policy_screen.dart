import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Introduction\n\n'
                'Welcome to Lovers Meet. We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application.\n\n'
                'Information We Collect\n\n'
                'Personal Data\n'
                'We may collect personally identifiable information, such as:\n'
                '- Contact Information: Name, email address, phone number.\n'
                '- Account Information: Username, password, profile details.\n\n'
                'Usage Data\n'
                'We collect information about your interactions with our app, including:\n'
                '- Device Information: IP address, device type, operating system.\n'
                '- Usage Data: Pages visited, time spent on pages, and other usage statistics.\n\n'
                'How We Use Your Information\n\n'
                'We use your information for various purposes, including:\n'
                '- Providing and Improving Our Services: To manage your account, provide customer support, and enhance user experience.\n'
                '- Personalization: To tailor content and recommendations to your interests.\n'
                '- Communication: To send you updates, notifications, and promotional materials.\n\n'
                'How We Share Your Information\n\n'
                'We do not sell or rent your personal information to third parties. We may share your information with:\n'
                '- Service Providers: Companies that help us operate our app and provide services, such as payment processors or analytics providers.\n'
                '- Legal Requirements: To comply with legal obligations or protect our rights.\n\n'
                'Security\n\n'
                'We implement reasonable security measures to protect your personal information from unauthorized access, use, or disclosure. However, no security system is impenetrable, and we cannot guarantee absolute security.\n\n'
                'Your Choices\n\n'
                'You have the following choices regarding your information:\n'
                '- Access and Update: You can access and update your personal information through your account settings.\n'
                '- Opt-Out: You can opt-out of receiving marketing communications by following the unsubscribe instructions in those messages.\n\n'
                'Changes to This Privacy Policy\n\n'
                'We may update this Privacy Policy from time to time. Any changes will be posted on this page with an updated effective date.\n\n'
                'Contact Us\n\n'
                'If you have any questions or concerns about this Privacy Policy, please contact us at:\n'
                '- Email: support@loversmeet.com\n'
                '- Address: Lovers Meet, 123 Love Lane, Romance City, RC 12345',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
