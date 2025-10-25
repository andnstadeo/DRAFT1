import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/scanning_screen.dart';
import 'screens/capture_photo_screen.dart';
import 'screens/signup/personal_info_screen.dart';
import 'screens/signup/verification_screen.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Locker System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/scan': (context) => const ScanScreen(),
        '/scanning': (context) => const ScanningScreen(),
        '/signup_personal': (context) => const PersonalInfoScreen(),
        '/signup_verification': (context) => const VerificationScreen(),
        '/capture': (context) => const CapturePhotoScreen(),
      },
    );
  }
}
