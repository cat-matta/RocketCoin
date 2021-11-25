import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rocketcoin/constants.dart';

import 'budget.dart';

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
          gradient: LinearGradient(colors: [DarkBlueAccent, DarkBlueAccent]),
          borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(8.0),
      height: size.height / 2.5,
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
              // print(new_items[0][0]);

              widget = ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    String key = items.keys.elementAt(index);
                    // num sum = 0;
                    // sum += items[key];

                    return Container(
                      child: ListTile(
                        leading: Text("Date",
                            style: GoogleFonts.spaceGrotesk(
                                textStyle: TextStyle(color: LightBlueAccent))),
                        title: Row(
                          children: [
                            Text("$key",
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                      color: LightPinkAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                )),
                            Spacer(),
                            Text("\$" + items[key].toStringAsFixed(2),
                                style: GoogleFonts.spaceGrotesk(
                                    textStyle: TextStyle(
                                        color: LightPinkAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal))),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              widget = Container(
                color: LightGrey,
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
