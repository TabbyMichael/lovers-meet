import 'package:flutter/material.dart';
import 'package:lovers_meet/login_page.dart';
import 'package:lovers_meet/matches-screen.dart';
import 'package:lovers_meet/PROFI/profile_setup_screen.dart';
import 'package:lovers_meet/signup_page.dart';
import 'package:lovers_meet/splash_page%20.dart';
import 'package:lovers_meet/swipe_card_screen.dart';
import 'package:lovers_meet/welcome_page.dart';
import 'package:lovers_meet/app_drawer.dart';

void main() {
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
        '/profileSetup': (context) => const ProfileSetupScreen(),
        '/home': (context) => Matches(),
        '/swipe': (context) => const SwipeCardScreen(),
      },
    );
  }
}
