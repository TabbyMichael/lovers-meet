import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Effective Date: [Date]',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Introduction',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Welcome to [App Name]! We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our app. Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Information We Collect',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'We may collect information about you in a variety of ways. The information we may collect includes:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '- Personal Data: Personally identifiable information, such as your name, email address, and contact information that you voluntarily give to us when you register with the app or when you choose to participate in various activities related to the app.',
              ),
              const Text(
                '- Derivative Data: Information our servers automatically collect when you access the app, such as your IP address, your browser type, your operating system, your access times, and the pages you have directly viewed.',
              ),
              const Text(
                '- Financial Data: Financial information, such as data related to your payment method (e.g., valid credit card number, card brand, expiration date) that we may collect when you purchase, order, return, exchange, or request information about our services from the app.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Use of Your Information',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the app to:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '- Assist Law Enforcement and Respond to Legal Requests: We may share your information with law enforcement agencies, government officials, or other authorities if required by law or if we believe in good faith that such action is necessary to comply with legal obligations or to protect the rights, property, or safety of our company or others.',
              ),
              const Text(
                '- Deliver targeted advertising: We may use your information to deliver targeted advertisements that we believe may be of interest to you.',
              ),
              const Text(
                '- Email You: We may use your information to send you email communications, including information about your account or updates to the app.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Disclosure of Your Information',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'We may share information we have collected about you in certain situations. Your information may be disclosed as follows:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '- By Law or to Protect Rights: If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation.',
              ),
              const Text(
                '- Business Transfers: We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Security of Your Information',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Changes to This Privacy Policy',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal, or regulatory reasons. We encourage you to review this privacy policy periodically to stay informed about our collection, use, and disclosure of your information.',
              ),
              const SizedBox(height: 16.0),
              Text(
                'Contact Us',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'If you have questions or comments about this privacy policy, please contact us at [Contact Information].',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
