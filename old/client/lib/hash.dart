import 'package:cryptography/cryptography.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String hash(String pass) {
  var encoded = utf8.encode(pass);
  var out = sha512.convert(encoded);
  return out.toString();
}
