import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Fetched data from api', () async {
    await http
        .get(Uri.parse("https://catfact.ninja/fact"))
        .then((value) => debugPrint(value.statusCode.toString()));
  });
}
