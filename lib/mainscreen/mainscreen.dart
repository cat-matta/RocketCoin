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
              Image(
                image: AssetImage('assets/images/rocketcoin.png'),
                height: 200,
              ),
              Spacer(),
              SleekCircularSlider(
                  min: 0,
                  max: 1000,
                  initialValue: 500,
                  appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                          progressBarColor: Color.fromRGBO(255, 196, 255, 1)),
                      infoProperties: InfoProperties(
                          modifier: (double value) {
                            final roundedvalue =
                                value.ceil().toInt().toString();
                            return "$roundedvalue";
                          },
                          mainLabelStyle: TextStyle(
                              color: Color.fromRGBO(255, 196, 255, 1),
                              fontSize: 35))),
                  onChange: (double value) {
                    print(value);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
