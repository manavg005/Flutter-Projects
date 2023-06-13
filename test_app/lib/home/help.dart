import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      // debugShowCheckedModeBanner: false,
      // title: 'Help',
      child: Scaffold(
        backgroundColor: Colors.indigo.shade800,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Help',
          ),
          elevation: 0,
          backgroundColor: Colors.indigo.shade800,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Query Type',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                    ],
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'Select',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Query Description',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    showCursor: true,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Type',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xC12148F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send',
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement the functionality to call customer service.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Color(0xC12148F3)),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: Color(0xC12148F3),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Call Customer Service',
                            style: TextStyle(
                              color: Color(0xC12148F3),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
