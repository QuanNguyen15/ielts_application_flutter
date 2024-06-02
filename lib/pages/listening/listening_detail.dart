import 'package:flutter/material.dart';

class ListeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening Practice'),
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
          'Listening Practice Content',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
