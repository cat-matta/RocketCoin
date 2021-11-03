import 'package:client/hash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:client/interface.dart';
import '../SignIn/signin.dart';
import '../../constants.dart';
import '../SignIn/LogoDark.dart';
import 'EmailField.dart';
import 'UserNameField.dart';
import 'background.dart';
import 'signupbtn.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}

final new_userNameFieldController = TextEditingController();
final emailFieldController = TextEditingController();
final NameFieldController = TextEditingController();

final new_passwordFieldController = TextEditingController();
final new_passwordFieldConfirmController = TextEditingController();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Size of the screen
    return Background(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LogoDark(size: size),
          // const SizedBox(
          //   height: 10,
          // ),
          Spacer(),
          UserNameField(),
          // const SizedBox(
          //   height: 40,
          // ),
          Spacer(),
          EmailField(),
          Spacer(),
          NameField(),
          Spacer(),

          PasswordField(),
          Spacer(),

          ConfirmPasswordField(),
          Spacer(),
          ExistingUserText(),
          Spacer(),

          SignUpBttn(),
        ],
      ),
    );
  }
}

class ExistingUserText extends StatelessWidget {
  const ExistingUserText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Already a user? Sign In!",
          style: GoogleFonts.habibi(
            textStyle: TextStyle(
                color: LightGrey.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            // this changes which page we go to
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => Signin()));
        new_userNameFieldController.clear();
        emailFieldController.clear();
        new_passwordFieldController.clear();
        new_passwordFieldConfirmController.clear();
        NameFieldController
            .clear(); // go to the sign in page instead if the user is registered already
      },
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 262,
      child: Container(
        decoration: BoxDecoration(
            color: LightBlueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Form(
          child: TextFormField(
              controller: new_passwordFieldController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: GoogleFonts.habibi(
                textStyle:
                    TextStyle(color: LightGrey.withOpacity(0.8), fontSize: 20),
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Icon(
                    Icons.lock_outline_rounded, // this is for the help button
                    color: LightBlueAccent,
                  ),
                ),
                labelText: 'Password...',
                labelStyle: GoogleFonts.habibi(
                  textStyle: TextStyle(
                    color: LightGrey.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  // fillColor: LightBlueAccent.withOpacity(0.2),
                ),
              ),
              onSaved: (String? pass) {
                print("Saved pass: $pass");
                // print(passwordFieldController.text);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password cannot be empty";
                }
                return null;
              }),
        ),
      ),
    );
  }
}

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 262,
      child: Container(
        decoration: BoxDecoration(
            color: LightBlueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Form(
          child: TextFormField(
            controller: new_passwordFieldConfirmController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            style: GoogleFonts.habibi(
              textStyle: TextStyle(
                color: LightGrey.withOpacity(0.8),
                fontSize: 20,
              ),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Icon(
                  Icons.lock_outline_rounded, // this is for the help button
                  color: LightBlueAccent,
                ),
              ),
              labelText: 'Confirm Password...',
              labelStyle: GoogleFonts.habibi(
                textStyle: TextStyle(
                  color: LightGrey.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onSaved: (String? pass) {
              print("Saved pass: $pass");
              // print(passwordFieldConfirmController.text);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              } else if (value != new_passwordFieldController.text) {
                return "Passwords must match";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class NameField extends StatefulWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  _NameField createState() => _NameField();
}

class _NameField extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 262,
      child: Container(
        decoration: BoxDecoration(
            color: LightBlueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Form(
          child: TextFormField(
            controller: NameFieldController,
            style: GoogleFonts.habibi(
                textStyle:
                    TextStyle(color: LightGrey.withOpacity(0.8), fontSize: 20)),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Icon(
                    Icons.person_rounded, // this is for the help button
                    color: LightBlueAccent,
                  ),
                ),
                labelText: 'Name...',
                labelStyle: GoogleFonts.habibi(
                  textStyle: TextStyle(
                    color: LightGrey.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  // fillColor: LightBlueAccent.withOpacity(0.2),
                )),
            onSaved: (String? name) {
              print("Saved Email: $name");

              // print(emailFieldController.text);
            },
            validator: (name) {
              if (name == null || name.isEmpty) {
                return "Name cannot be empty";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
