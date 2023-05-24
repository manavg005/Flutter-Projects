import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://learnopencv.com/wp-content/uploads/2021/04/image-15.png";
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
        backgroundColor: Colors.indigo.shade800,
        appBar: AppBar(
          title: const Text(
            'Profile',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/profile_img.jpeg",
                      width: 150,
                    ),
                  ),
                  // const SizedBox(height: 16),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Name',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // const Divider(
                  //   // height: 20,
                  //   thickness: 5,
                  // ),
                  // const SizedBox(height: 16),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Designation',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // const Divider(
                  //   // height: 20,
                  //   thickness: 5,
                  // ),
                  // const SizedBox(height: 16),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Mobile Number',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // const Divider(
                  //   // height: 20,
                  //   thickness: 5,
                  // ),
                  // const SizedBox(height: 16),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'CPIS Number',
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // const Divider(
                  //   // height: 20,
                  //   thickness: 5,
                  // ),
                  _createDataTable(),
                  const SizedBox(height: 120),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          // side: BorderSide(color: Color(0xC12148F3)),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

DataTable _createDataTable() {
  return DataTable(
    columns: _createColumns(),
    rows: _createRows(),
    dividerThickness: 3,
    dataRowHeight: 50,
    showBottomBorder: true,
    headingTextStyle:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  );
}

List<DataColumn> _createColumns() {
  return [
    const DataColumn(label: Text('')),
    const DataColumn(label: Text('')),
  ];
}

List<DataRow> _createRows() {
  return [
    const DataRow(cells: [
      DataCell(
          Text('Name', style: TextStyle(fontSize: 12, color: Colors.grey))),
      DataCell(
          Text('Rishi Kumar', style: TextStyle(fontWeight: FontWeight.bold)))
    ]),
    const DataRow(cells: [
      DataCell(Text('Designation',
          style: TextStyle(fontSize: 12, color: Colors.grey))),
      DataCell(
        Text('Teacher', style: TextStyle(fontWeight: FontWeight.bold)),
      )
    ]),
    const DataRow(cells: [
      DataCell(Text('Mobile Number',
          style: TextStyle(fontSize: 12, color: Colors.grey))),
      DataCell(
        Text('9876543210', style: TextStyle(fontWeight: FontWeight.bold)),
      )
    ]),
    const DataRow(cells: [
      DataCell(Text('CPIS Number',
          style: TextStyle(fontSize: 12, color: Colors.grey))),
      DataCell(
        Text('CW123G', style: TextStyle(fontWeight: FontWeight.bold)),
      )
    ])
  ];
}
