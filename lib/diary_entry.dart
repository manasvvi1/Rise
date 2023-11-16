// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rise/constants.dart';
import 'package:rise/navigationBar.dart';

class DiaryEntry extends StatefulWidget {
  @override
  _DiaryEntryState createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  var child;
  var children;
  final _auth = FirebaseAuth.instance;
  String entry = "";

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
                    entry = value;
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
              onPressed: (){
                try{
                  final userUID =
                      FirebaseAuth.instance.currentUser?.uid;
                  DateTime timestamp = DateTime.timestamp();
                  String stringTime = '${timestamp.year}-${timestamp.month}-${timestamp.day} (${timestamp.hour}:${timestamp.minute}:${timestamp.second})';
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(userUID)
                      .update({
                      stringTime : entry,
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyNavBar()),
                  );
                }
                catch (e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
