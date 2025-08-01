import 'dart:developer';
import 'package:flutter/material.dart';

import '../widgets/custom_textformfield.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.0533,
          screenHeight * 0.0493,
          screenWidth * 0.0533,
          screenHeight * 0.0197,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Sign up now',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: screenHeight * 0.0148),
              Text(
                'Please fill the details and create account',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7D848D),
                ),
              ),
              SizedBox(height: screenHeight * 0.0493),
              CustomTextFormField(
                hintText: 'Enter your name',
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Name can only contain letters and spaces';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.0296),
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
              SizedBox(height: screenHeight * 0.0887),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log('Form is valid');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    } else {
                      log('Form is invalid');
                    }
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.0393),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
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
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Or connect',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7D848D),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1867,
                ), // 70/375
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/png/fb_icon.png',
                      width: screenWidth * 0.1173,
                      height: screenWidth * 0.1173,
                    ),
                    Image.asset(
                      'assets/png/insta_icon.png',
                      width: screenWidth * 0.1173,
                      height: screenWidth * 0.1173,
                    ),
                    Image.asset(
                      'assets/png/twitter_icon.png',
                      width: screenWidth * 0.1173,
                      height: screenWidth * 0.1173,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
