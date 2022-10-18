import 'dart:developer';

import 'package:flutter/material.dart';
import 'textinput2.dart';

class MultiLineTextField extends StatefulWidget {
  final inputList;
  MultiLineTextField(this.inputList);

  //const MultiLineTextField({super.key});

  @override
  _MultiLineTextFieldState createState() =>
      _MultiLineTextFieldState(this.inputList);
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  // text controller to handle user entered data in textfield

  final TextEditingController _Textcontroller = TextEditingController();
  List<Widget> list = [];
  static List<String> textInputs = [];
  int totalBoxCounter = 1;

  Widget returnWidget(int index) {
    int idx = 0;
    if (index == -1) {
      idx = 1;
    } else {
      idx = list.length + 1;
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text((idx).toString() + ". I wish I ... "),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 65,
            child: TextFormField(
              controller: TextEditingController(),
              maxLines: 2,
              onChanged: (newValue) {
                if (textInputs.length < totalBoxCounter) {
                  textInputs.add('');
                }
                if (idx == 1) {
                  textInputs[0] = newValue;
                } else {
                  textInputs[index] = newValue;
                }
              },
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: 'Enter Here',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  _MultiLineTextFieldState(List<String> t) {
    textInputs = t;
  }

  // void increment_counter() {
  //   for (var i = 0; i < list.length; i++) {
  //     Text("Why do you want to be more" + list[i].toString());
  //     Container(
  //       width: 200,
  //       child: TextFormField(
  //         controller: _Textcontroller,
  //         minLines: 2,
  //         maxLines: 5,
  //         keyboardType: TextInputType.multiline,
  //         decoration: InputDecoration(
  //             hintText: 'Enter Here',
  //             hintStyle: TextStyle(color: Colors.grey),
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(3)),
  //             )),
  //       ),
  //     );
  //   }
  // }

  // Use this to retrieve the input list.
  static List<String> getList() {
    return textInputs;
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      list.add(returnWidget(-1));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Container(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: "HEDGIE",
                  child: Image.asset(
                    'assets/cute5.jpg',
                    width: 400,
                    height: 60,
                  ),
                ),
              ],
            ),
            Container(height: 20),

            Text("List all of the ways that you wish you were different.",
                style: TextStyle(fontSize: 23)),

            Container(height: 20),
            Container(height: 20),

            //

            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Column(
            //     children: [
            //       Text("1. I wish I were ... "),
            //       Container(
            //         width: MediaQuery.of(context).size.width - 10,
            //         height: 65,
            //         child: TextFormField(
            //           controller: TextEditingController(),
            //           maxLines: 2,
            //           onChanged: (newValue) {
            //             if (textInputs.length < 1) {
            //               textInputs.add('');
            //             }
            //             textInputs[0] = newValue;
            //             print(textInputs);
            //           },
            //           keyboardType: TextInputType.multiline,
            //           decoration: InputDecoration(
            //               hintText: 'Enter Here',
            //               hintStyle: TextStyle(color: Colors.grey),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(3)),
            //               )),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            ...list,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          totalBoxCounter++;
          list.add(returnWidget(textInputs.length));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
