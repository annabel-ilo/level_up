import 'package:flutter/material.dart';
import 'package:level_up/ui/movie/movieScreen.dart';

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
