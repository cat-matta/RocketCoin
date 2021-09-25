import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mainscreen.dart';

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
