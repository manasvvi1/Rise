import 'package:flutter/material.dart';
import 'package:rise/analytics.dart';
import 'package:rise/constants.dart';
import 'package:rise/diary.dart';
import 'package:rise/screens/discussion/DiscussionScreen.dart';
import 'package:rise/profile.dart';
import 'package:rise/recommendations.dart';

class MyNavBar extends StatefulWidget {
  MyNavBar ({Key? key}) : super(key: key);

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DearDiary(),
    Recommendations(),
    Analytics(),
    Discussions()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void handleClick(String value) {
    switch (value) {
      case 'Profile':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 'Settings':
        break;
      case 'Logout':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RISE - Heal and Rise!', style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Profile','Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Dear Diary',
            // backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Recommendations',
            // backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
            // backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Discussions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: PRIMARY_DARK_PINK,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}