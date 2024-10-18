import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lovers_meet/interests_selection_page.dart';
import 'package:lovers_meet/profi/profile_setup_screen.dart';
import 'package:lovers_meet/auth/splash_page%20.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Import all the necessary screens and components

import 'package:lovers_meet/auth/welcome_page.dart';
import 'package:lovers_meet/auth/login_page.dart';
import 'package:lovers_meet/auth/signup_page.dart';
import 'package:lovers_meet/settings/privacy_policy_screen.dart';
import 'package:lovers_meet/home/swipe_card_screen.dart';
import 'package:lovers_meet/settings/terms_of_service_screen.dart';
import 'package:lovers_meet/settings/account_settings_screen.dart';
import 'package:lovers_meet/home/app_drawer.dart';
import 'package:lovers_meet/matches_screen.dart'; // Import MatchesScreen here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize firebase
  await Firebase.initializeApp();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        'https://tsfavcerqlmszlgqtyrx.supabase.co', // Replace with your Supabase URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzZmF2Y2VycWxtc3psZ3F0eXJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY0NDg1ODMsImV4cCI6MjA0MjAyNDU4M30.Z-n4LOKFaxsCXchkWZjAim0sN7d7Hq3xcs1tLlnrEWs', // Replace with your Supabase anon key
  );

  runApp(const LoversMeetApp());
}

class LoversMeetApp extends StatelessWidget {
  const LoversMeetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Lovers Meet',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // Disable the debug banner
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/interests': (context) => const InterestsSelectionPage(),
        '/profileSetup': (context) => const ProfileSetupScreen(),
        '/privacy': (context) => const PrivacyPolicyScreen(),
        '/swipe': (context) => const SwipeCardScreen(),
        '/app_drawer': (context) => const AppDrawer(),
        '/terms': (context) => const TermsOfServiceScreen(),
        '/account_settings': (context) => const AccountSettingsScreen(),
        '/matches': (context) =>
            const MatchesScreen(), // Added route for MatchesScreen
      },
    );
  }
}
