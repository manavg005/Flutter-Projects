import 'package:flutter/material.dart';
import 'package:crud_task1/sql_helper.dart';
import 'package:crud_task1/add_edit.dart';
import 'package:crud_task1/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLITE',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _students = [];
  bool _isLoading = true;

  void _refreshStudents() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _students = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshStudents();
    // print("..number of items ${_students.length}");
  }

  void _addItem() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditPage()),
    );
    _refreshStudents();
  }

  void _updateItem(Map<String, dynamic> updatedValues) {
    final itemId = updatedValues['id'];
    final index = _students.indexWhere((item) => item['id'] == itemId);

    if (index != -1) {
      final name = updatedValues['name'];
      final rollNo = updatedValues['rollNo'];
      final courseName = updatedValues['courseName'];

      SQLHelper.updateItem(itemId, name, rollNo, courseName)
          .then((rowsAffected) {
        if (rowsAffected > 0) {
          setState(() {
            _students[index]['name'] = name;
            _students[index]['rollNo'] = rollNo;
            _students[index]['courseName'] = courseName;
          });
        }
      }).catchError((error) {
        // Handle error if needed
        print('Error updating item: $error');
      });
    }

    _refreshStudents();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully deleted a Student!'),
      ),
    );
    _refreshStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          // style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) => Card(
          color: Colors.orange[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(_students[index]['name']),
            subtitle: Text(_students[index]['courseName']),
            trailing: SizedBox(
              width: 100,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    item: _students[index],
                    onDeleteItem: (itemId) {
                      _deleteItem(itemId);
                    },
                    onUpdateItem: (updatedValues) {
                      _updateItem(updatedValues);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
