import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/forgotpassword_screen.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_button.dart';
import '../screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_snackbar.dart';
import '../services/app_data.dart';
import '../screens/phone_number_screen.dart';
import '../services/google_service.dart';
import '../widgets/custom_bottom_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final userService = UserService();


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.0533,
          screenHeight * 140 / 812,
          screenWidth * 0.0533,
          screenHeight * 0.0813,
        ),
        child: TapRegion(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Sign in now',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0147),
                Text(
                  'Please sign in to continue our app',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7D848D),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0492),
                CustomTextFormField(
                  hintText: 'Enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.0296),
                CustomTextFormField(
                  hintText: 'Enter your Password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be 8 character';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.0492),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Sign In',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final uid = FirebaseAuth.instance.currentUser?.uid;

                          print('Current user UID: $uid');
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const Center(child: CircularProgressIndicator()),
                          );


                          final UserCredential userCredential =
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );

                          final user = FirebaseAuth.instance.currentUser;
                          final userDocRef = FirebaseFirestore.instance.collection('users').doc(user!.uid);

                          if (!(await userDocRef.get()).exists) {
                            await userDocRef.set({
                              'name': user.displayName ?? '',
                              'email': user.email ?? '',
                              'createdAt': FieldValue.serverTimestamp(),
                            });
                          }

                          await userService.fetchAndCacheUserData();
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);


                          Navigator.of(context).pop();

                          log('User logged in: ${userCredential.user?.email}');



                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const PhoneNumberInputScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          Navigator.of(context).pop();

                          String message = '';
                          if (e.code == 'user-not-found') {
                            message = 'No user found with this email.';
                          } else if (e.code == 'wrong-password') {
                            message = 'Incorrect password.';
                          } else {
                            message = 'Authentication failed. ${e.message}';
                          }

                          CustomSnackbar(context).show(
                            message: message,
                            backgroundColor: Colors.red,
                          );
                        } catch (e) {
                          Navigator.of(context).pop();
                          CustomSnackbar(context).show(
                            message: 'Error!',
                            backgroundColor: Colors.red,
                          );
                        }
                      } else {
                        log('Form is invalid');
                      }
                    },


                  ),
                ),
                SizedBox(height: screenHeight * 0.0492),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7D848D),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.0246),
                Text(
                  'Or connect',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7D848D),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1866,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // TODO: Handle Facebook login
                        },
                        icon: Image.asset(
                          'assets/png/fb_icon.png',
                          width: screenWidth * 0.1173,
                          height: screenWidth * 0.1173,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final userCredential = await signInWithGoogle(context);
                          if (userCredential != null) {
                            await userService.fetchAndCacheUserData();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavWrapper()),
                            );
                          }
                        },
                        icon: Image.asset(
                          'assets/png/google.png',
                          width: screenWidth * 0.1173,
                          height: screenWidth * 0.1173,
                        ),
                      ),
                      IconButton(
                        onPressed: () {

                        },

                        icon: Image.asset(
                          'assets/png/insta_icon.png',
                          width: screenWidth * 0.1173,
                          height: screenWidth * 0.1173,
                        ),
                      ),
                    ],

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
