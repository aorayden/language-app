import 'package:flutter/material.dart';
import 'package:language_app/activities/onboarding_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'Fredoka',
  ),
  initialRoute: '/onboardingScreen',
  routes: {
    '/onboardingScreen': (context) => const OnboardingScreen(),
  },
));