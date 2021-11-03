import 'package:client/Screens/Main/mainscreen.dart';
import 'package:client/constants.dart';
import 'package:client/hash.dart';
import 'package:client/interface.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signin.dart';

String? users_name;

class SignInBttn extends StatelessWidget {
  const SignInBttn({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 262,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15),
            backgroundColor: MedBlueAccent.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: LightBlueAccent.withOpacity(0.2),
              ),
            )),
        child: Text(
          "Sign in",
          style: GoogleFonts.habibi(
              textStyle: TextStyle(
            color: LightGrey.withOpacity(0.8),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
        ),
        onPressed: () async {
          if (userNameFieldController.text.length == 0 ||
              passwordFieldController.text.length == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: DarkBlueAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: LightBlueAccent.withOpacity(0.2),
                ),
              ),
              padding: EdgeInsets.all(8),
              content: Text(
                "Fields cannot be empty",
                textAlign: TextAlign.center,
                style: GoogleFonts.habibi(
                  textStyle: TextStyle(
                    color: LightGrey.withOpacity(0.8),
                    fontSize: 20,
                  ),
                ),
              ),
            ));
          } else {
            // var url = Uri.http('http://192.168.1.11:5000/ ', 'hello');
            var t = HttpStuff(); //Our Http Interface
            var status = await t.login(
              userNameFieldController.text,
              hash(passwordFieldController.text),
            );

            if (status == false) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: DarkBlueAccent,
                behavior: SnackBarBehavior.floating,
                // width: ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: LightBlueAccent.withOpacity(0.2),
                  ),
                ),
                padding: EdgeInsets.all(8),
                content: Text(
                  "Username or password invalid",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.habibi(
                    textStyle: TextStyle(
                      color: LightGrey.withOpacity(0.8),
                      fontSize: 20,
                    ),
                  ),
                ),
              ));
            } else {
              users_name = status;
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => MainScreen()));

              userNameFieldController.clear();
              passwordFieldController.clear(); // clears password

            }
          }
        },
      ),
    );
  }
}
