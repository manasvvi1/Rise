import 'package:flutter/material.dart';
import 'package:rise/constants.dart';

class Login extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;

  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('RISE - Heal and Rise!', style: TextStyle(color: Colors.black),),
            backgroundColor: PRIMARY_PINK,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      ),),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: TextField(
                          showCursor: false,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          ),
                        )),
                    SizedBox(
                      height: 15,
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
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,
                        ),),
                      onPressed: () {
                        // try {
                        //   final signUser =
                        //   await _auth.signInWithEmailAndPassword(
                        //       email: email, password: password);
                        //   userUID = FirebaseAuth.instance.currentUser?.uid;
                        //   getDetails();
                        //   if (signUser != null) {
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Subjects()),
                        //     );
                        //   }
                        // } catch (e) {
                        //   print(e);
                        // }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not yet a member?'),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        }, child: Text('Sign Up Here'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('RISE - Heal and Rise', style: TextStyle(color: Colors.black),),
          backgroundColor: PRIMARY_PINK,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text('SIGN UP',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          // name = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // contactNum = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Contact Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          // email = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Email ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        onChanged: (value) {
                          // password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: TextField(
                        showCursor: false,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        onChanged: (value) {
                          // confirmPassword = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: PRIMARY_DARK_PINK,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () async {
                      // if (password == confirmPassword) {
                      //   try {
                      //     final newUser =
                      //     await _auth.createUserWithEmailAndPassword(
                      //         email: email, password: password);
                      //
                      //     final userUID =
                      //         FirebaseAuth.instance.currentUser?.uid;
                      //
                      //     FirebaseFirestore.instance
                      //         .collection('students')
                      //         .doc(userUID)
                      //         .set({
                      //       'name': name,
                      //       'contactNumber': contactNum,
                      //       'emailAddress': email,
                      //       'enrollmentNumber': enrollmentNo,
                      //       'password': password,
                      //     });
                      //     if (newUser != null) {
                      //       Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Subjects()),
                      //       );
                      //     }
                      //   } catch (e) {
                      //     print(e);
                      //   }
                      // }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a member?'),
                      TextButton(onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }, child: Text('Login Here'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}