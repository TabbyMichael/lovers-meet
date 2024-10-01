import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lovers_meet/auth/auth_services.dart';

class GoogleSignInService {
  final AuthService _authService = AuthService(); // Your own auth service class
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In Method
  Future<User?> signInWithGoogle() async {
    try {
      // Initiate Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        print('Google Sign-In canceled');
        return null;
      }

      // Obtain authentication details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        // Handle missing token issue
        print('Missing Google Auth tokens');
        return null;
      }

      // Create a new credential using the accessToken and idToken
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      // Sign in to Firebase with the Google credential
      User? user = await _authService.signInWithCredential(credential);

      if (user != null) {
        print('Google Sign-In successful: ${user.displayName}');
      }

      return user;
    } catch (error) {
      // Handle any errors during the process
      print('Error during Google Sign-In: $error');
      return null;
    }
  }

  // Sign out from Google
  Future<void> signOutFromGoogle() async {
    try {
      await _googleSignIn.signOut(); // Sign out from Google
      await _authService.signOut(); // Sign out from Firebase as well
      print('Signed out from Google and Firebase');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
