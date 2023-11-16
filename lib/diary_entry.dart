// ignore: file_names
import 'package:flutter/material.dart';
import 'package:rise/constants.dart';

class DiaryEntry extends StatefulWidget {
  @override
  _DiaryEntryState createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  var child;
  var children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RISE - Heal and Rise!',
          style: TextStyle(color: Color(0xfffcfcfc)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality for the back button
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            Text(
              'How are you doing today?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Record it in max 100 lines',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  minLines: 5,
                  maxLines: 100,
                  showCursor: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    // userName = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Start Writing...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  ),
                )),
            SizedBox(height: 10),
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
                  'Done',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
