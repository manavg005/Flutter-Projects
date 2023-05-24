import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://learnopencv.com/wp-content/uploads/2021/04/image-15.png";

    return Scaffold(
        backgroundColor: Colors.indigo.shade800,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Profile',
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.indigo.shade800,
        ),
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/profile_img.jpeg",
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 3,
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid)),
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: Text('Name'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(left: 90),
                              child: Text('Rishi Kumar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: Text('Name'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(left: 90),
                              child: Text('Rishi Kumar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
