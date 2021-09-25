import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rocketcoin/interface.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

// final List<List<String>> items = [
//   ["item1", "23"],
//   ["item3", "21"],
//   ["item2", "20"],
//   ["item4", "22"],
//   ["item5", "200"],
//   ["item6", "211"],
//   ["item7", "2211"],
//   ["item8", "2212"],
//   ["item5", "200"],
//   ["item6", "211"],
//   ["item7", "2211"],
//   ["item8", "2212"]
// ];

var t = HttpStuff();

final value = TextEditingController();
final name = TextEditingController();
Future<String> getTransactions() async {
  var response = await t.show_all();
  return response;
}

// final List<List<String>> items = getTransactions() as List<List<String>>;

// void PrintStuff() {
//   for (int i = 0; i < items1.length; i++) {
//     print(items1[i]);
//   }
// }

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
              Row(
                children: [
                  SizedBox(
                      height: 60,
                      width: 200,
                      child: Form(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(18, 30, 98, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextFormField(
                              controller: name,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                color: Color.fromRGBO(255, 196, 255, 1),
                                fontSize: 20,
                              )),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8.0),
                                  child: Icon(
                                    Icons
                                        .savings_outlined, // this is for the help button
                                    color: Color.fromRGBO(40, 173, 241, 1),
                                  ),
                                ),
                                labelText: 'Name',
                                labelStyle: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                  color: Color.fromRGBO(40, 173, 241, 1),
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
                              color: Color.fromRGBO(18, 30, 98, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextFormField(
                              controller: value,
                              // obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                color: Color.fromRGBO(255, 196, 255, 1),
                                fontSize: 20,
                              )),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8.0),
                                  child: Icon(
                                    Icons
                                        .attach_money, // this is for the help button
                                    color: Color.fromRGBO(40, 173, 241, 1),
                                  ),
                                ),
                                labelText: 'Value',
                                labelStyle: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                  color: Color.fromRGBO(40, 173, 241, 1),
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
                      color: Color.fromRGBO(18, 30, 98, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Color.fromRGBO(40, 173, 241, 1)),
                    onPressed: () async {
                      print("pressed");
                      print(name.text);
                      print(value.text);
                      var category = "Rand";
                      var status =
                          await t.new_trans(value.text, name.text, category);
                      if (status == true) {
                        print("added to db");
                      }
                    },
                    child: Text(
                      "Add Transaction",
                      style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(18, 30, 98, 1),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              TransactionsList(),
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
                            return "\$" + "$roundedvalue";
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

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          // color: Colors.white.withOpacity(1),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(18, 30, 98, 1),
            Color.fromRGBO(18, 30, 98, 1)
          ]),
          borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(8.0),
      height: size.height / 4,
      width: size.width - 40,
      child: FutureBuilder(
          future: getTransactions(),
          builder: (BuildContext context, snapshot) {
            Widget widget;
            widget = Text("Testing");
            if (snapshot.connectionState == ConnectionState.done) {
              // print("hi");
              var new_items = snapshot.data.toString();
              var items = jsonDecode(new_items);
              print(items['stars']);

              // print(new_items[0][0]);

              widget = ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    String key = items.keys.elementAt(index);

                    return Container(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("$key",
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(255, 196, 255, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                )),
                            Spacer(),
                            Text("\$" + items[key].toString(),
                                style: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(255, 196, 255, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal))),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              widget = Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return widget;
          }),
    );
  }
}
