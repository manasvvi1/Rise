import 'package:flutter/material.dart';
import 'package:rise/constants.dart';
import 'package:rise/home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var child;
  var children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('RISE - Heal and Rise!', style: TextStyle(color: Colors.black),),),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle_outlined,
                            size: 100,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text('User Name : ' + 'Simran',
                          ),
                          Text('Display Name : ' + 'simsim',
                          ),
                          Text('Email ID : ' + 'simranarora@gmail.com',
                              ),
                          Text('Contact Number : ' + '9876543210'),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text('Some quotes to keep you going!', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 20),),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border:  Border.all(width: 2.0, color: PRIMARY_DARK_PINK),
                                ),
                                child: Column(
                                  children: [
                                    Text("Happiness can be found in the darkest of times if only one remembers to turn on the light.", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15),
                                    ),
                                    Text("-Albus Dumbledore"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border:  Border.all(width: 2.0, color: PRIMARY_DARK_PINK),
                                ),
                                child: Column(
                                  children: [
                                    Text("Even the darkest night will end and the sun will rise again.", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15),
                                    ),
                                    Text("-Victor Hugo"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border:  Border.all(width: 2.0, color: PRIMARY_DARK_PINK),
                                ),
                                child: Column(
                                  children: [
                                    Text("There's hope even when your brain tells you there isn't.", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15),
                                    ),
                                    Text("-John Green"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border:  Border.all(width: 2.0, color: PRIMARY_DARK_PINK),
                                ),
                                child: Column(
                                  children: [
                                    Text("Just because no one else can heal or do your inner work for you, doesn't mean you can, should, or need to do it alone!", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15),
                                    ),
                                    Text("-Lisa Olivera"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
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
                                'CONTACT US',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,),
                                textAlign: TextAlign.center,
                              ),),
                            onPressed: () {}
                          ),
                          SizedBox(height: 10,),
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
                                  'LOGOUT',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                          ),
                        ]),
                  )),
            ),
          ),
        );
  }
}