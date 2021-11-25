import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocketcoin/interface.dart';
import 'package:rocketcoin/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rocketcoin/background.dart';
import 'transactionslist.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

var t = HttpStuff();

final value = TextEditingController();
final name = TextEditingController();
Future<String> getTransactions() async {
  var response = await t.show_all();
  return response;
}

var current = [500];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Background(
        child: Container(
          color: BackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                // Image(
                //   image: AssetImage('assets/images/rocketcoin.png'),
                //   height: 200,
                // ),
                SizedBox(
                  height: 20,
                ),
                // SleekCircularSlider(
                //     min: 0,
                //     max: 1000,
                //     initialValue: 500,
                //     appearance: CircularSliderAppearance(
                //         customColors: CustomSliderColors(
                //             progressBarColor: LightPinkAccent),
                //         infoProperties: InfoProperties(
                //             modifier: (double value) {
                //               final roundedvalue =
                //                   value.ceil().toInt().toString();
                //               return "\$" + "$roundedvalue";
                //             },
                //             mainLabelStyle: TextStyle(
                //                 color: LightPinkAccent, fontSize: 35))),
                //     onChange: (double value) {
                //       print(value);
                //     }),
                Spacer(),
                TransactionsList(),
                Spacer(),
                Row(
                  children: [
                    SizedBox(
                        height: 60,
                        width: 200,
                        child: Form(
                          child: Container(
                            decoration: BoxDecoration(
                                color: DarkBlueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: TextFormField(
                                controller: name,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                  color: LightPinkAccent,
                                  fontSize: 20,
                                )),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 8.0),
                                    child: Icon(
                                      Icons
                                          .savings_outlined, // this is for the help button
                                      color: LightBlueAccent,
                                    ),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: GoogleFonts.spaceGrotesk(
                                      textStyle: TextStyle(
                                    color: LightBlueAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                                )),
                          ),
                        )),
                    Spacer(),
                    SizedBox(
                        height: 60,
                        width: 150,
                        child: Form(
                          child: Container(
                            decoration: BoxDecoration(
                                color: DarkBlueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: TextFormField(
                                controller: value,
                                // obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                  color: LightPinkAccent,
                                  fontSize: 20,
                                )),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 8.0),
                                    child: Icon(
                                      Icons
                                          .attach_money, // this is for the help button
                                      color: LightBlueAccent,
                                    ),
                                  ),
                                  labelText: 'Value',
                                  labelStyle: GoogleFonts.spaceGrotesk(
                                      textStyle: TextStyle(
                                    color: LightBlueAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                                )),
                          ),
                        ))
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 60,
                  width: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        color: DarkBlueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: LightBlueAccent),
                      onPressed: () async {
                        print("pressed");
                        print(name.text);
                        print(double.parse(value.text));
                        // var category = "Rand";
                        var status = await t.new_trans(value.text, name.text);
                        if (status == true) {
                          print("added to db");
                        }
                      },
                      child: new Text(
                        "Add Transaction",
                        style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                                color: DarkBlueAccent,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
