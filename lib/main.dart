import 'package:flutter/material.dart';
import 'package:rocketcoin/Screens/SignUp/signup.dart';
// import 'package:rocketcoin/Screens/mainscreen/mainscreen.dart';
import 'Screens/Main/mainscreen.dart';
import 'Screens/SignIn/signin.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RocketCoin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: BackgroundColor,
        scaffoldBackgroundColor: BackgroundColor,
      ),
      home: SafeArea(
        child: MainScreen(),
        top: false,
        bottom: false,
      ),
    );
  }
}
