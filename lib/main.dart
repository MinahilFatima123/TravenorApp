import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 👈 Required
import 'package:travelapp/screens/splash_screen.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: travelAppTheme,
      home: SplashScreen(),
    );
  }
}
