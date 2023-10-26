import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/constants.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  String selectedValue = 'Movies';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Search for Recommendations',
                  style: TextStyle(
                    fontSize: 20,
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
                  onChanged: (value) {
                  },
                  decoration: InputDecoration(
                    hintText: "Enter an input",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  ),
                ),),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(child: Text("Books"),value: "Books"),
                      DropdownMenuItem(child: Text("Movies"),value: "Movies"),
                      DropdownMenuItem(child: Text("Music"),value: "Music")
                    ],
                    value: selectedValue,
                    onChanged: (String? newValue){
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Select the type of recommendation",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                    'SEARCH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                  ),),
                onPressed: () {
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
