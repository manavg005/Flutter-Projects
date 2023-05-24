import 'package:api_test/services/user_api.dart';
import 'package:flutter/material.dart';

import 'package:api_test/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Test"),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          // final color = user.gender == "male" ? Colors.blue : Colors.lightGreen;

          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.country),
            // tileColor: color,
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserAPI.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
