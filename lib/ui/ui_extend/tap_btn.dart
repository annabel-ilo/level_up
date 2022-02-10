import 'package:flutter/material.dart';

class TapMeBtn extends StatelessWidget {
  const TapMeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text('First snackbar created, Lets do Flutter !!!'),
          backgroundColor: Colors.greenAccent[700],
          elevation: 12.0,
        );
        // ignore: deprecated_member_use
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Text(
                    ' Tap Me ! ',
                    style: TextStyle(
                      color: Colors.green[500],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
      ),
    );
  }
}
