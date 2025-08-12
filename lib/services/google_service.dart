import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/signin_screen.dart';
import '../widgets/custom_snackbar.dart';

Future<UserCredential?> signInWithGoogle(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      Navigator.of(context).pop();
      CustomSnackbar(context).show(
        message: "Google sign-in cancelled",
        backgroundColor: Colors.orange,
        icon: Icons.info,
      );
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
    await FirebaseAuth.instance.signInWithCredential(googleCredential);

    final user = userCredential.user;
    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnapshot = await userDoc.get();
      if (!docSnapshot.exists) {
        await userDoc.set({
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    Navigator.of(context).pop();
    CustomSnackbar(context).show(
      message: "Signed in successfully",
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );

    return userCredential;
  } on FirebaseAuthException catch (e) {
    Navigator.of(context).pop();

    if (e.code == 'account-exists-with-different-credential') {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Account Exists'),
          content: const Text(
            'An account already exists with the same email but different sign-in method. Please sign in using email and password.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      CustomSnackbar(context).show(
        message: "Google sign-in error: ${e.message ?? e.code}",
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    }
    return null;
  } catch (e) {
    Navigator.of(context).pop();
    CustomSnackbar(context).show(
      message: "Error signing in: $e",
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
    return null;
  }
}
