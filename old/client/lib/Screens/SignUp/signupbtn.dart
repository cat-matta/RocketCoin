import 'package:client/Screens/Main/mainscreen.dart';
import 'package:client/Screens/SignIn/signin.dart';
import 'package:client/Screens/SignUp/signup.dart';
import 'package:client/constants.dart';
import 'package:client/hash.dart';
import 'package:client/interface.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBttn extends StatelessWidget {
  const SignUpBttn({
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
            backgroundColor: MedBlueAccent.withOpacity(
                0.2), //Color.fromRGBO(27, 63, 207, .2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: LightBlueAccent.withOpacity(0.2),
              ), //color: Color.fromRGBO(44, 190, 248, 0.1)
            )),
        child: Text(
          "Sign up",
          style: GoogleFonts.habibi(
            textStyle: TextStyle(
              color: LightGrey.withOpacity(0.8),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () async {
          if (new_userNameFieldController.text.length == 0 ||
              emailFieldController.text.length == 0 ||
              NameFieldController.text.length == 0 ||
              new_passwordFieldController.text.length == 0 ||
              new_passwordFieldConfirmController.text.length == 0) {
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
          } else if (new_passwordFieldController.text !=
              new_passwordFieldConfirmController.text) {
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
                "Passwords do not match",
                textAlign: TextAlign.center,
                style: GoogleFonts.habibi(
                  textStyle: TextStyle(
                    color: LightGrey.withOpacity(0.8),
                    fontSize: 20,
                  ),
                ),
              ),
            ));
            print("Password not the same"); // request password again
            new_passwordFieldController.clear(); // clears password
            new_passwordFieldConfirmController.clear(); // clears password2
          } else {
            var t = HttpStuff(); //Our Http Interface
            var status = await t.signup(
                new_userNameFieldController.text,
                hash(new_passwordFieldController.text),
                emailFieldController.text,
                NameFieldController.text); //Parameters for signup
            print("OUR STATUS FOR SIGN UP IS $status");

            // this will print an error message if the email doesnt meet Regex, maybe can do it right before checking db
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
                  "Username or email already exist",
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
              // String name = NameFieldController.text;
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => Signin()));

              new_userNameFieldController.clear();
              emailFieldController.clear();
              new_passwordFieldController.clear();
              new_passwordFieldConfirmController.clear();
              NameFieldController.clear();
            }
          }
        },
      ),
    );
  }
}
