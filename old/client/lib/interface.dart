import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

String base_url =
    "http://127.0.0.1:5000/"; // change this url when running flask server

class HttpStuff {
  final client = http.Client();

  ///Uses the http client from the http library

  var signUP =
      Uri.parse(base_url + 'signup'); //Parses the flask url and gets data

  signup(user, pass, email, name) async {
    http.Response response = await client.post(signUP, body: {
      'email': email,
      'password': pass,
      'username': user,
      'name': name
    });

    if (response.statusCode == 200) {
      // var r = convert.jsonDecode(response.body);
      // String name = r["name"];
      print("FLUTTER SIGN UP ALL GOOD!");
      return true;
    } else if (response.statusCode == 400) {
      print(convert.jsonDecode(response.body));
      print("FLUTTER SIGN UP ALL BAD!");
      return false;
    } else if (response.statusCode == 500) {
      print("Uh oh network error");
      return false;
    }
  }

  var logIn = Uri.parse(base_url + 'login');

  login(user, pass) async {
    http.Response response = await client.post(logIn, body: {
      'user': user,
      'password': pass,
    });

    if (response.statusCode == 200) {
      //If 200 we get into the page
      var r = convert.jsonDecode(response.body);
      String name = r["name"];
      print("FLUTTER SIGN IN ALL GOOD!");
      return name;
    } else if (response.statusCode == 400) {
      print(convert.jsonDecode(response.body));
      print("FLUTTER SIGN IN ALL BAD!");
      return false;
    }
  }
}
