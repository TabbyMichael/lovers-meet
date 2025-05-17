import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of Service',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 3, 132),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Introduction
              Text(
                'Introduction',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'By accessing and using Lovers Meet, you agree to comply with these Terms of Service, '
                'which govern your use of the app and all related features and services.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Eligibility
              Text(
                'Eligibility',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'You must be at least 18 years old to create an account and use Lovers Meet. By using the '
                'app, you represent and warrant that you are legally able to form a binding contract.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Account Responsibilities
              Text(
                'Account Responsibilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Users are responsible for maintaining the confidentiality of their login information and '
                'all activities that occur under their account.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // User Conduct
              Text(
                'User Conduct',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Users agree not to engage in any activity that may be considered unlawful, harmful, or '
                'abusive towards other members of the community. Any violation of this conduct may '
                'result in account suspension or termination.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Content Ownership and License
              Text(
                'Content Ownership and License',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Users retain ownership of any content they post on Lovers Meet, but by posting, you '
                'grant us a worldwide, non-exclusive, royalty-free license to use, display, and distribute '
                'your content.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Privacy
              Text(
                'Privacy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Our Privacy Policy explains how we collect, use, and protect your personal information. '
                'By using Lovers Meet, you agree to the collection and use of information in accordance '
                'with the Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Termination of Account
              Text(
                'Termination of Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We reserve the right to terminate or suspend your account at any time without notice if '
                'we believe you have violated these Terms of Service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Disclaimers and Limitations of Liability
              Text(
                'Disclaimers and Limitations of Liability',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Lovers Meet is provided "as is," and we make no warranties, either expressed or implied, '
                'about the app\'s functionality or its fitness for a particular purpose.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Changes to Terms
              Text(
                'Changes to Terms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We reserve the right to modify these Terms of Service at any time. Your continued use of '
                'Lovers Meet after any changes constitutes acceptance of the new terms.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Dispute Resolution
              Text(
                'Dispute Resolution',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Any disputes arising from the use of Lovers Meet will be governed by the laws of '
                '[Your Jurisdiction], and users agree to resolve such disputes through arbitration.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
