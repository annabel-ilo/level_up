import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:level_up/ui/inspireScreen.dart';
import 'package:level_up/ui/movieScreen.dart';
import 'package:level_up/ui/quizScreen.dart';
import 'package:level_up/ui/tipsplit.dart';
import 'ui/homeScreen.dart';

// void main() {
//   runApp(Home());
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieListView(),
    ),
  );
}
