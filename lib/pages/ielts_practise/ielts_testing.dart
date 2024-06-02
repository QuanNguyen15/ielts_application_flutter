import 'package:flutter/material.dart';

class IeltsTestingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('IELTS Testing Practice'),
          elevation: 0,
          backgroundColor: Colors.blue[500],
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Part 1'),
                  Tab(text: 'Part 2'),
                  Tab(text: 'Part 3'),
                  Tab(text: 'Part 4'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildListView('Part 1'),
                  buildListView('Part 2'),
                  buildListView('Part 3'),
                  buildListView('Part 4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(String part) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        // Calculate progress value (from 0.0 to 1.0)
        double progressValue = (index + 1) / 10.0;
        // Calculate score
        int score = index + 1;
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          elevation: 4.0,
          child: ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text('$part: Item ${(index + 1)}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 5),
                Text('Score: $score/10'),
              ],
            ),
          ),
        );
      },
    );
  }
}
