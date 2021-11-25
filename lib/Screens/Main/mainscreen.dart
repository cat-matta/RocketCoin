import 'package:rocketcoin/background.dart';
import 'package:rocketcoin/Screens/SignIn/signin.dart';
import 'package:rocketcoin/Screens/SignIn/signinbtn.dart';
import 'package:rocketcoin/Screens/SignUp/signupbtn.dart';
import 'package:rocketcoin/Screens/Main/cardmodel.dart';
import 'package:rocketcoin/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:rocketcoin/interface.dart';

import 'transactionslist.dart';

var t = HttpStuff();

final value = TextEditingController();
final name = TextEditingController();
Future<String> getTransactions() async {
  var response = await t.show_all();
  print(response);
  return response;
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // String? name = userNameFieldController.text;
    Size size = MediaQuery.of(context).size; // Size of the screen
    final CategoriesScroller categoriesScroller = CategoriesScroller();
    ScrollController controller = ScrollController();
    bool closeTopContainer = false;
    double topContainer = 0;
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: DarkBlueAccent.withOpacity(0.6),
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                "$users_name's account",
                style: GoogleFonts.spaceGrotesk(
                    textStyle: TextStyle(
                        color: LightBlueAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              )),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "Wallets",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.manage_accounts_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "Manage Accounts",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.trending_up_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "Spending Insights",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "App Settings",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.help_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "Help",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: LightBlueAccent,
                ),
                title: Text(
                  "Logout",
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: LightGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => Signin()));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: BackgroundColor.withOpacity(0.1),
        foregroundColor: BackgroundColor.withOpacity(0.1),
        shadowColor: BackgroundColor.withOpacity(0),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_outlined,
              color: PinkAccent,
              size: 35,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "$users_name's Wallet",
          style: GoogleFonts.spaceGrotesk(
            textStyle: TextStyle(
                color: LightBlueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          PopupMenuButton(
              color: DarkBlueAccent.withOpacity(0.8),
              icon: Icon(
                Icons.add_rounded,
                color: PinkAccent,
                size: 35,
              ),
              onSelected: (newValue) async {
                if (newValue == 1) {
                  await prompt(context,
                      title: Text(
                        "Add Card",
                        style: GoogleFonts.spaceGrotesk(
                          textStyle:
                              TextStyle(color: BackgroundColor, fontSize: 18),
                        ),
                      ),
                      textOK: Text(
                        "Add Card",
                        style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                                color: BackgroundColor, fontSize: 18)),
                      ),
                      textCancel: Text(
                        "Cancel",
                        style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                                color: BackgroundColor, fontSize: 18)),
                      ));
                } else if (newValue == 2) {
                  print("add transaction");
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        "Add Card",
                        style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(color: LightGrey, fontSize: 18),
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Add Transaction",
                        style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(color: LightGrey, fontSize: 18),
                        ),
                      ),
                      value: 2,
                    )
                  ])
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        width: size.width,
        height: size.height,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: FractionalOffset.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.credit_card_rounded,
                    color: LightBlueAccent,
                    size: 25,
                  ),
                  Spacer(),
                  Text(
                    "Cards",
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: PinkAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            // put cards here
            //insights?
            // then put the transactions

            Center(
              child: Stack(
                children: [
                  CarouselSlider(
                      items: [
                        Container(
                            height: 25,
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Colors.lightBlue.withOpacity(0.5),
                                  Colors.blue.withOpacity(0.2),
                                  Colors.black.withOpacity(0.5)
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "Chase Bank",
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                      color: LightGrey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )),
                        Container(
                            height: 250,
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.topLeft,
                                colors: [
                                  Colors.red.withOpacity(0.8),
                                  Colors.red.shade900.withOpacity(0.3)
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "Bank of America",
                                style: GoogleFonts.spaceGrotesk(
                                  textStyle: TextStyle(
                                      color: LightGrey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: size.height / 3,
                          aspectRatio: 16 / 9))
                ],
              ),
            ),
            // Spacer(),
            Text("Transactions",
                style: GoogleFonts.spaceGrotesk(
                    textStyle: TextStyle(
                        color: LightBlueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            Center(
              child: TransactionsList(),
            ),

            // Center(),
            // CategoriesScroller(),
          ],
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: LightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
