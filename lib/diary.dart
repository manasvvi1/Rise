import 'package:flutter/material.dart';
import 'package:rise/constants.dart';
import 'package:rise/diary_entry.dart';

class DearDiary extends StatefulWidget {
  const DearDiary({Key? key}) : super(key: key);

  @override
  State<DearDiary> createState() => _DearDiaryState();
}

class _DearDiaryState extends State<DearDiary> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: PRIMARY_DARK_PINK,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Wanna Write?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center,
                    ),),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiaryEntry()),
                    );
                  },
                ),
                SizedBox(width: 16), // Add spacing between buttons
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    // Add functionality for the second button
                  },
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        color: PRIMARY_DARK_PINK,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Wanna Record?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                      ),),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
            SizedBox(
              // Use of SizedBox
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Express yourself by either writing down your thoughts or sharing them vocally. We value your experiences and encourage you to document your journey!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your Previous Entries!',
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.arrow_circle_right),
                        title: Text('Saturday, 11/11/23'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_right),
                        title: Text('Sunday, 12/11/23'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_right),
                        title: Text('Monday, 13/11/23'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_right),
                        title: Text('Tuesday, 14/11/23'),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_circle_right),
                        title: Text('Wednesday, 14/11/23'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
