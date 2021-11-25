import 'package:rocketcoin/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Size of the screen

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          // Positioned(child: Image.asset("assets/images/accent1.png")),
          child,
        ],
      ),
    );
  }
}
