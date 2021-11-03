import 'package:flutter/material.dart';

// import 'mainscreen/mainscreen.dart';

import 'transaction/transaction.dart';

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
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.blue[900],
      ),
      home: SafeArea(child: Transaction()),
    );
  }
}
