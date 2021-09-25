import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<List<String>> items = [
  ["item1", "23"],
  ["item3", "21"],
  ["item2", "20"],
  ["item4", "22"],
  ["item5", "200"],
  ["item6", "211"],
  ["item7", "2211"],
  ["item8", "2212"],
  ["item5", "200"],
  ["item6", "211"],
  ["item7", "2211"],
  ["item8", "2212"]
];

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
              SizedBox(
                height: 60,
                width: 150,
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Color.fromRGBO(40, 173, 241, 1)),
                  onPressed: () {},
                  child: Text(
                    "Add Transaction",
                    style: GoogleFonts.spaceGrotesk(
                        textStyle:
                            TextStyle(color: Color.fromRGBO(18, 30, 98, 1))),
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
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Text(items[index][0],
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(255, 196, 255, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      )),
                  Spacer(),
                  Text("\$" + items[index][1],
                      style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(255, 196, 255, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.normal))),
                ],
              ),
            );
          }),
    );
  }
}
