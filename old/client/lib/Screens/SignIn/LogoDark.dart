import 'package:flutter/material.dart';

class LogoDark extends StatelessWidget {
  const LogoDark({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 0.5,
      height: size.height / 5,
      child: Image.asset(
        "assets/images/FTPBank.png",
      ),
    );
  }
}
