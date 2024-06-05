import 'package:flutter/material.dart';

class ListeningTestPage extends StatefulWidget {
  @override
  _ListeningTestPageState createState() => _ListeningTestPageState();
}

class _ListeningTestPageState extends State<ListeningTestPage> {
  int currentQuestionIndex = 0;
  bool isPlaying = true;
  double volume = 0.5;
  List<int> selectedAnswers = List<int>.filled(7, -1);

  // Dummy questions and answers
  List<Map<String, Object>> questions = [
    {
      'question': 'Question 1: What is the main topic of the conversation?',
      'answers': ['A. Topic 1', 'B. Topic 2', 'C. Topic 3', 'D. Topic 4']
    },
    {
      'question': 'Question 2: What is the name of the speaker?',
      'answers': ['A. John', 'B. Mary', 'C. Alice', 'D. Bob']
    },
    {
      'question': 'Question 3: Where did the event take place?',
      'answers': ['A. City Hall', 'B. Community Center', 'C. Library', 'D. School']
    },
    {
      'question': 'Question 4: What time did the meeting start?',
      'answers': ['A. 10 AM', 'B. 2 PM', 'C. 5 PM', 'D. 7 PM']
    },
    {
      'question': 'Question 5: How many people attended?',
      'answers': ['A. 10', 'B. 20', 'C. 30', 'D. 40']
    },
    {
      'question': 'Question 6: What was the main issue discussed?',
      'answers': ['A. Parking', 'B. Budget', 'C. Safety', 'D. Noise']
    },
    {
      'question': 'Question 7: What was the final decision?',
      'answers': ['A. Approved', 'B. Rejected', 'C. Postponed', 'D. Under review']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening Test 1'),
        backgroundColor: Color(0xFF2196F3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timer
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8),
                  Text('20 minutes'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Audio Player Controls
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.replay_10),
                  onPressed: () {
                    // Handle rewind 10 seconds
                  },
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  onPressed: () {
                    // Handle forward 10 seconds
                  },
                ),
                Expanded(
                  child: Slider(
                    value: 0.0,
                    onChanged: (value) {
                      // Handle audio position change
                    },
                  ),
                ),
                Icon(Icons.volume_up),
                Expanded(
                  child: Slider(
                    value: volume,
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Question and Answers
            Text(
              'Choose A, B, C, or D:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(questions[currentQuestionIndex]['question'] as String),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (questions[currentQuestionIndex]['answers'] as List<String>)
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key;
                        String answer = entry.value;
                        return RadioListTile(
                          title: Text(answer),
                          value: index,
                          groupValue: selectedAnswers[currentQuestionIndex],
                          onChanged: (value) {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = value as int;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Question Navigation
            Container(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentQuestionIndex = index;
                        });
                      },
                      child: Text('${index + 1}'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 30), backgroundColor: currentQuestionIndex == index
                            ? Color(0xFF2196F3)
                            : Colors.grey,
                        side: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
