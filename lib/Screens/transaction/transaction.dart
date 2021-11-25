import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocketcoin/interface.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rocketcoin/Screens/Main/budget.dart';

class SetBudget extends StatefulWidget {
  const SetBudget({Key? key}) : super(key: key);

  @override
  _SetBudget createState() => _SetBudget();
}

class _SetBudget extends State<SetBudget> {
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
              MaterialButton(
                minWidth: 185.0,
                height: 87,
                color: Color.fromRGBO(40, 173, 241, 1),
                child: Text(
                  "Add Transaction",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(18, 30, 98, 1),
                          fontWeight: FontWeight.bold)),
                ),
                // child: new Text('Start Saving',
                //     style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (MainScreen())),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
