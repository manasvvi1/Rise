import 'package:flutter/material.dart';
import 'package:rise/constants.dart';

import 'login-signup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: PRIMARY_PINK,
        body: Center(
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png'),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                        ),
                        child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: PRIMARY_DARK_PINK,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'PTSerif-Bold',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: PRIMARY_DARK_PINK,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}