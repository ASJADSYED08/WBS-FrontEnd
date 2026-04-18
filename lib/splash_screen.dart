import 'package:flutter/material.dart';
import 'package:ned_project/auth/login_screen.dart';
import 'package:ned_project/auth/sign_up_screen.dart';
// import 'package:flutter/widgets.dart'

import 'export_alll.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      (() => Get.to(
            () => LoginScreen(),
          )),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0078D4),  // Professional blue
              Color(0xff005A9E),  // Deep blue
              Color(0xff1E3A5F),  // Dark blue-gray
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\"WorkAssist\"",
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Image(
              image: AssetImage("assets/icons/logos.png"),
            ),
          ],
        ),
      ),
    );
  }
}
