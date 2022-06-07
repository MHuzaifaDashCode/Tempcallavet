import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tempcallavet/constants.dart';
import 'package:tempcallavet/Screens/login/login_screen.dart';



Future<void> main() async {

  runApp(SplashScreen());
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  String iconPath = "assets/images/Welcome Vet.png";
  return Image.asset(
    iconPath,
  );
}
