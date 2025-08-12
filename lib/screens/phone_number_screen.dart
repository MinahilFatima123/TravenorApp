import 'package:flutter/material.dart';
import '../screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_snackbar.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../screens/signin_screen.dart';

class PhoneNumberInputScreen extends StatefulWidget {
  const PhoneNumberInputScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberInputScreen> createState() => _PhoneNumberInputScreenState();
}

class _PhoneNumberInputScreenState extends State<PhoneNumberInputScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  void _sendOtp() async {
    final phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) {
      CustomSnackbar(context).show(
        message: 'Please enter your phone number',
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto sign-in on Android devices if possible
        await FirebaseAuth.instance.signInWithCredential(credential);
        setState(() {
          _isLoading = false;
        });
        CustomSnackbar(context).show(
          message: 'Phone number automatically verified!',
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });
        CustomSnackbar(context).show(
          message: 'Verification failed: ${e.message}',
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timed out; user must enter OTP manually
      },
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title:('Phone Number'),
        onBackTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SignInScreen()),
          );
        },
      ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.0533,
              screenHeight * 0.0493,
              screenWidth * 0.0533,
              screenHeight * 0.0197,
            ),

                child: Column(
          children: [

            CustomTextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
               child: _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: 'Send OTP',
                  onPressed: _sendOtp,
                )

            ),

          ],
        ),
      ),


    );
  }
}
