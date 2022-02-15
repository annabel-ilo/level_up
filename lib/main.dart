import 'package:flutter/material.dart';
import 'package:level_up/ui/tipsplit.dart';
import 'package:level_up/util/colors.dart';

// void main() {
//   runApp(Home());
// }

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData();

  return base.copyWith(
    primaryColor: primaryPurple200,
    scaffoldBackgroundColor: primaryPurpleLight,
    hintColor: textOnPrimaryPurple,
    cardColor: primaryPurpleLight,

    // textTheme: const TextTheme(
    //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
  );
}

void main() {
  runApp(
    MaterialApp(
      theme: _appTheme,
      debugShowCheckedModeBanner: false,
      home: TipSplit(),
    ),
  );
}
