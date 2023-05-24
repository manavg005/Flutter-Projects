import 'dart:convert';
import 'package:api_test/model/user.dart';
import 'package:api_test/model/user_dob.dart';
import 'package:api_test/model/user_location.dart';
import 'package:flutter/material.dart';

import '../model/user_name.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<List<User>> fetchUsers() async {
    debugPrint('fetch user called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDOB(
        age: e['dob']['age'],
        dob: DateTime.parse(date),
      );
      final coordinates = LocationCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude'],
      );
      final street = LocationStreet(
        number: e['location']['street']['number'],
        name: e['location']['street']['name'],
      );
      final timezone = LocationTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description'],
      );
      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          street: street,
          coordinates: coordinates,
          timezone: timezone);
      return User(
        gender: e['gender'],
        mail: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();

    debugPrint("fetch user completed");
    return users;
  }
}
