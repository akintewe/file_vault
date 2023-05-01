import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth screen/login.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds before showing the second splash screen
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        // Change the state to display the second splash screen
        _showSecondSplashScreen = true;
      });
      // Wait for 2 more seconds before navigating to the homepage
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()), //OnBoarding
        );
      });
    });
  }

  bool _showSecondSplashScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _showSecondSplashScreen
              ? Scaffold(
                  backgroundColor: Color.fromRGBO(137, 89, 208, 1),
                  body: Center(
                    child: SizedBox(
                        child: Lottie.asset('assets/animations/safe1.json')),
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: SizedBox(
                        child: Lottie.asset('assets/animations/safe1.json')),
                  ),
                )),
    );
  }
}
