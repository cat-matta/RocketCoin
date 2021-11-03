import 'package:client/constants.dart';
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
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/accent1.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/accent2.png"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.help_outline_rounded, // this is for the help button
                color: LightBlueAccent,
              ),
              onPressed: () {}, // it should redirect to about
            ),
          ),
          child,
        ],
      ),
    );
  }
}
