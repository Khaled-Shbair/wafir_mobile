import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final String? idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return null;
      }
      return idToken;
    } catch (e) {
      debugPrint('Google Sign-In error: $e');
      return null;
    }
  }
}
