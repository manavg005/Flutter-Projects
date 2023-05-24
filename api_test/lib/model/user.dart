import 'package:api_test/model/user_dob.dart';
import 'package:api_test/model/user_location.dart';
import 'package:api_test/model/user_name.dart';

class User {
  final String gender;
  final String mail;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDOB dob;
  final UserLocation location ;

  User({
    required this.gender,
    required this.mail,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
  });
  String get fullName {
    return '${name.title} ${name.first} ${name.last} ';
  }
}
