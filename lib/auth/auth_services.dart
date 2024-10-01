import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with a given credential
  Future<User?> signInWithCredential(AuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Error signing in with credential: $e');
      return null;
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  // Sign out from Firebase
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('Signed out from Firebase');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
