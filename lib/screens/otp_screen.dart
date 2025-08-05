import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../screens/signin_screen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../widgets/custom_button.dart';
import 'dart:async';
import '../widgets/custom_snackbar.dart';
import '../widgets/custom_bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = '';
  Duration _duration = const Duration(minutes: 2);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = _duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final seconds = _duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        onBackTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SignInScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.0533,
            screenHeight * 0.0098,
            screenWidth * 0.0533,
            screenHeight * 0.3916,
          ),
          child: TapRegion(
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.0493),
                Text(
                  'OTP Verification',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0148),
                Text(
                  'Please check your email www.uihut@gmail.com to see the verification code',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    color: const Color(0xFF7D848D),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0493),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'OTP Code',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0197),
                OtpTextField(
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  fieldWidth: screenWidth * 0.1867,
                  borderRadius: BorderRadius.circular(12),
                  focusedBorderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  disabledBorderColor: Colors.transparent,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  onSubmit: (String code) {
                    _otpCode = code;
                  },
                ),
                SizedBox(height: screenHeight * 0.0493),
                CustomButton(
                  text: 'Verify',
                  onPressed:()async {
                    if (_otpCode.length == 4) {
                      //saves login state
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavWrapper(),
                        ),
                      );
                    } else {
                      CustomSnackbar(context).show(
                        message: 'Please enter the complete OTP',
                        backgroundColor: Colors.redAccent,
                        icon: Icons.warning_amber_rounded,
                      );
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.0197),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Resend code to',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF7D848D),
                      ),
                    ),
                    Text(
                      timerText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7D848D),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
