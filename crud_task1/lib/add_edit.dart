import 'package:flutter/material.dart';
import 'package:crud_task1/sql_helper.dart';

class EditPage extends StatefulWidget {
  final int? id;
  final String? name;
  final String? rollNo;
  final String? courseName;

  const EditPage({Key? key, this.id, this.name, this.rollNo, this.courseName})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name ?? '';
    print(widget.name);
    _rollNoController.text = widget.rollNo ?? '';
    _courseNameController.text = widget.courseName ?? '';
  }

  void _saveJournal(BuildContext context) async {
    final name = _nameController.text;
    final rollNo = _rollNoController.text;
    final courseName = _courseNameController.text;
    if (widget.id == null) {
      await SQLHelper.createItem(name, rollNo, courseName);
    } else {
      final updatedRows =
          await SQLHelper.updateItem(widget.id!, name, rollNo, courseName);
      if (updatedRows > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item updated successfully')),
        );

        Navigator.pop(context, {
          'id': widget.id,
          'name': name,
          'rollNo': rollNo,
          'courseName': courseName,
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update item')),
        );
      }
    }

    Navigator.pop(context, {
      'id': widget.id,
      'name': name,
      'rollNo': rollNo,
      'courseName': courseName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id == null ? 'Add Details' : 'Edit Details',
          // style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _rollNoController,
              decoration: const InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _courseNameController,
              decoration: const InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () => _saveJournal(context), // Pass the context here
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  widget.id == null ? 'Add' : 'Update',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
