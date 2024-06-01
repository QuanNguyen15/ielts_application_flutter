import 'package:flutter/material.dart';

class IeltsTestingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ielts Testing Practice'),
        elevation: 0,
        backgroundColor: Colors.blue[500],
        actions: const [
          IconButton(
            onPressed: (null),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Ielts Testing Content',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
