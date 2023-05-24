import 'package:flutter/material.dart';
import 'package:crud_task1/sql_helper.dart';
import 'package:crud_task1/add_edit.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  final void Function(int) onDeleteItem;
  final void Function(Map<String, dynamic>) onUpdateItem;

  const DetailPage({
    Key? key,
    required this.item,
    required this.onDeleteItem,
    required this.onUpdateItem,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Map<String, dynamic> _item;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  void _deleteItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                SQLHelper.deleteItem(_item['id']);
                Navigator.pop(context);
                widget.onDeleteItem(
                    _item['id']); // Call the onDeleteItem callback
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _updateItem(Map<String, dynamic> updatedValues) async {
    final id = updatedValues['id'];
    final name = updatedValues['name'];
    final rollNo = updatedValues['rollNo'];
    final courseName = updatedValues['courseName'];

    await SQLHelper.updateItem(id, name, rollNo, courseName);

    setState(() {
      // Update the displayed values
      _item = updatedValues;
    });

    widget.onUpdateItem(
        updatedValues); // Call the onUpdateItem callback with the updated values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Details',
          // style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => _deleteItem(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              readOnly: true,
              initialValue: _item['name'],
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              readOnly: true,
              initialValue: _item['rollNo'],
              decoration: InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              readOnly: true,
              initialValue: _item['courseName'],
              decoration: InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final updatedValues = await Navigator.push(
                    context,
                    MaterialPageRoute<Map<String, dynamic>>(
                      builder: (context) => EditPage(
                        id: _item['id'],
                        name: _item['name'],
                        rollNo: _item['rollNo'],
                        courseName: _item['courseName'],
                      ),
                    ),
                  );

                  if (updatedValues != null) {
                    _updateItem(updatedValues);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
