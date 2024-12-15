import 'package:flutter/material.dart';
import 'package:hiremi_t3/screens/payment_verification_screen.dart';
import 'package:hiremi_t3/screens/profile_verification_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiremi Task 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'PoppinsMedium',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F5F5)
        )
      ),
      home: const ProfileVerificationScreen1(),
    );
  }
}
