import 'package:flutter/material.dart';
import 'package:ielts_practise_flutter_project/pages/grammar_detail.dart';
import 'package:ielts_practise_flutter_project/pages/home.dart';
import 'package:ielts_practise_flutter_project/pages/ielts_testing.dart';
import 'package:ielts_practise_flutter_project/pages/listening_detail.dart';
import 'package:ielts_practise_flutter_project/pages/reading_detail.dart';
import 'package:ielts_practise_flutter_project/pages/speaking_detail.dart';
import 'package:ielts_practise_flutter_project/pages/writing_detail.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IeltsPracticeScreen(),
        '/listening': (context) => ListeningScreen(),
        '/reading': (context) => ReadingScreen(),
        '/writing': (context) => WritingScreen(),
        '/speaking': (context) => SpeakingScreen(),
        '/grammar': (context) => GrammarScreen(),
        '/ielts_testing': (context) => IeltsTestingScreen(),
      },
    );
  }
}
