import 'package:flutter/material.dart';
import 'package:level_up/ui/ui_extend/biz_card.dart';
import 'package:level_up/ui/ui_extend/tap_btn.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatelessWidget {
  _email() {
    print('New Email');
  }

  _profile() {
    print('Update Profile');
  }

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent[200],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text('Doing It Right'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _email();
              },
              icon: Icon(Icons.email)),
          IconButton(
              onPressed: () {
                _profile();
              },
              icon: Icon(Icons.perm_identity_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.local_activity),
      ),

      body: Container(
        color: Colors.amberAccent[200],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [BizCard(), TapMeBtn()],
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.greenAccent[700],
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.yellow)),
        ),
        child: new BottomNavigationBar(
          // backgroundColor: Colors.amberAccent,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined), label: "Schedule"),
            BottomNavigationBarItem(
                icon: Icon(Icons.preview), label: "Monitor"),
            BottomNavigationBarItem(
                icon: Icon(Icons.safety_divider_outlined), label: "Social"),
          ],
          onTap: (int index) {
            debugPrint('$index');
          },
        ),
      ),
    );
  }
}
