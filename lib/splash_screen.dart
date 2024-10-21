import 'dart:async';

import 'package:flutter/material.dart';
import 'package:screl/modules/home/views/home_screen.dart';
import 'package:screl/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading(),
    );
  }
}
