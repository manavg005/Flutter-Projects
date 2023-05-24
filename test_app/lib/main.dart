import 'package:flutter/material.dart';
// import 'package:task1/phone.dart';

import 'phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "phone",
      routes: {"phone": (context) => const MyPhone()},
    );
  }
}

// import 'package:http/http.dart';
// import 'dart:convert';

// void main() async {
//   Client client = Client();

//   Response response = await client.get(Uri.parse(
//       "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all"));
//   print(response.statusCode);
//   print(response.body);
//   Map responseBody = jsonDecode(response.body);
//   // print(responseBody);
//   Map<String, String> jsonVar = {
//     "name": "John Smith",
//     "email": "john@example.com"
//   };
//   print(jsonVar["name"]);

//   SampleResponseModel res = SampleResponseModel.fromJson(jsonVar);

//   print(res.email);
// }

// class SampleResponseModel {
//   String? name;
//   String? email;

//   SampleResponseModel({this.name, this.email});

//   SampleResponseModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'] ?? "";
//   }
// }
