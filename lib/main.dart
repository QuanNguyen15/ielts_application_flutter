import 'package:flutter/material.dart';
import 'package:ielts_practise_flutter_project/pages/grammar/grammar_list.dart';
import 'package:ielts_practise_flutter_project/pages/layout/home.dart';
import 'package:ielts_practise_flutter_project/pages/ielts_practise/ielts_testing_list.dart';
import 'package:ielts_practise_flutter_project/pages/listening/listening_list.dart';
import 'package:ielts_practise_flutter_project/pages/reading/reading_list.dart';
import 'package:ielts_practise_flutter_project/pages/speaking/speaking_list.dart';
import 'package:ielts_practise_flutter_project/pages/writing/writing_list.dart';


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
