import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromRGBO(45, 46, 106, 1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SleekCircularSlider(
                  appearance: CircularSliderAppearance(),
                  onChange: (double value) {
                    print(value);
                  }),
              Spacer(),
              Image(
                image: AssetImage('assets/images/rocketcoin.png'),
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
