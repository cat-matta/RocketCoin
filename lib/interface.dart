import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:rocketcoin/Screens/Main/budget.dart';

import 'package:http/http.dart' as http;

String base_url =
    "http://127.0.0.1:5000/"; // change this url when running flask server

class HttpStuff {
  final client = http.Client();

  ///Uses the http client from the http library

  var new_transaction =
      Uri.parse(base_url + 'new'); //Parses the flask url and gets data

  new_trans(value, name) async {
    http.Response response = await client.post(new_transaction, body: {
      'value': value,
      'name': name,
      // 'category': category,
    });

    if (response.statusCode == 200) {
      // var r = convert.jsonDecode(response.body);
      // String name = r["name"];
      // print("FLUTTER SIGN UP ALL GOOD!");
      return true;
    } else if (response.statusCode == 400) {
      print(convert.jsonDecode(response.body));
      // print("FLUTTER SIGN UP ALL BAD!");
      return false;
    } else if (response.statusCode == 500) {
      print("Uh oh network error");
      return false;
    }
  }

  var showall = Uri.parse(base_url + 'showall');

  show_all() async {
    http.Response response = await client.get(showall);
    if (response.statusCode == 200) {
      //If 200 we get into the page

      final json = response.body;
      // Iterable I
      return json;
    } else if (response.statusCode == 400) {
      print(convert.jsonDecode(response.body));
      print("Uh Oh!");
      return false;
    }
  }
}
