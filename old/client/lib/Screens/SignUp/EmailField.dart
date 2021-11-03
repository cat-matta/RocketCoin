import 'package:google_fonts/google_fonts.dart';

import 'signup.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 262,
      child: Form(
        child: Container(
          decoration: BoxDecoration(
              color: LightBlueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: TextFormField(
            controller: emailFieldController,
            style: GoogleFonts.habibi(
                textStyle:
                    TextStyle(color: LightGrey.withOpacity(0.8), fontSize: 20)),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Icon(
                    Icons.mail_outline_rounded, // this is for the help button
                    color: LightBlueAccent,
                  ),
                ),
                labelText: 'Email...',
                labelStyle: GoogleFonts.habibi(
                  textStyle: TextStyle(
                    color: LightGrey.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  // fillColor: LightBlueAccent.withOpacity(0.2),
                )),
            onSaved: (String? email) {
              print("Saved Email: $email");
              // print(emailFieldController.text);
            },
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Email cannot be empty";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
