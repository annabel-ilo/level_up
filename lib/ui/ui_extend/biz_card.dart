import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _cardText(),
          _getAvarter(),
        ],
      ),
    );
  }

  _cardText() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Developer FreshFish',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Email: devfreshfish@gmail.com'),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_1),
              SizedBox(
                width: 15.0,
              ),
              Text("If it's to be, it's up to me")
            ],
          )
        ],
      ),
    );
  }

  _getAvarter() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: NetworkImage('https://picsum.photos/300/300'),
        fit: BoxFit.cover),
      ),
    );
  }
}
