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
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0), // Match padding of list items
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
                buildAnimatedPracticeCard(context, 'IELTS TESTING', Icons.pending_actions, '/ielts_testing'),
                buildAnimatedPracticeCard(context, 'LISTENING', Icons.hearing, '/listening'),
                buildAnimatedPracticeCard(context, 'READING', Icons.book, '/reading'),
                buildAnimatedPracticeCard(context, 'WRITING', Icons.edit, '/writing'),
                buildAnimatedPracticeCard(context, 'SPEAKING', Icons.mic, '/speaking'),
                buildAnimatedPracticeCard(context, 'GRAMMAR', Icons.language, '/grammar'),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedPracticeCard(BuildContext context, String title, IconData iconData, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: 1.0,
        curve: Curves.easeIn,
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
                  Icon(
                    iconData,
                    size: 40.0,
                    color: Colors.blue, // Icon color
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    title,
                    style: TextStyle(fontSize: 18.0),
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
