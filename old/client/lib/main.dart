import 'package:client/Screens/SignIn/signin.dart';
import 'package:client/Screens/SignUp/signup.dart';
import 'package:flutter/material.dart';
import 'package:client/Screens/Main/mainscreen.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FTPBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: BackgroundColor,
        scaffoldBackgroundColor: BackgroundColor,
      ),
      home: SafeArea(child: MainScreen()),
    );
  }
}
/*
class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

*/