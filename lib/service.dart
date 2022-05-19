import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'models/quotes.dart';
import 'package:http/http.dart';

class Httpservice {
  final Uri postURL = Uri.parse(
    "https://quotes.rest/qod?category=funny",
  );

  Future<List<Quotes>> getQuotes() async {
    Response res = await get(postURL);

    final jsonItems = json.decode(res.body)["contents"]["quotes"];
    List<Quotes> quote = jsonItems.map<Quotes>((json) {
      if (kDebugMode) {
        print(json);
      }
      return Quotes.fromJson(json);
    }).toList();
    // quoteOfTheDay = quote;
    return quote;
  }
}
//Future<location> createAlbum(String title) async {
//
 // final response = await post(
   // Uri.parse('https://api.weatherapi.com/v1/current.json?key=d47e1ca59c784b2390f201859221804&q=Accra&aqi=yes'),
  //  body: jsonEncode(<String, String>{
  //    'title': title,
  //  }),
  //);

 // if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  //  return location.fromJson(jsonDecode(response.body));
  //} else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
  //  throw Exception('Failed to create album.');
  //}
//}
