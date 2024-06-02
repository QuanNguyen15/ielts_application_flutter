import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sidebar.dart';

class IeltsPracticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IELTS PRACTICES'),
        elevation: 0,
        backgroundColor: Colors.blue[500],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0), // Add spacing below the app bar
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
                autoPlay: true,
                viewportFraction: 1.0, // Makes each slide take full width
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0), // Match padding of list items
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Center(
                            child: Text(
                              'slide $i',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/ielts_testing');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.pending_actions, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('IELTS TESTING', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/listening');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.hearing, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('LISTENING', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/reading');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.book, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('READING', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/writing');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.edit, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('WRITING', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/speaking');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.mic, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('SPEAKING', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/grammar');
                  },
                  child: Container(
                    height: 140.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Card(
                      elevation: 4.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.language, size: 40.0),
                            SizedBox(width: 20.0),
                            Text('GRAMMAR', style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
