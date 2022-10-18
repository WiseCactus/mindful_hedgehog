import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'textinput.dart';

class MultiLineTextField2 extends StatefulWidget {
  const MultiLineTextField2({super.key});

  @override
  _MultiLineTextField2State createState() => _MultiLineTextField2State();
}

class _MultiLineTextField2State extends State<MultiLineTextField2> {
  // text controller to handle user entered data in textfield
  final TextEditingController _Textcontroller = TextEditingController();
  //textinput.

  @override
  Widget build(BuildContext context) {
    //List<String> inputList = textinput.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Container(height: 40),
            Image.asset(
              'assets/heart.gif',
              width: 400,
              height: 60,
            ),
            Container(height: 20),
            (_Textcontroller.value.text.isEmpty)
                ? Text("Now ask yourself, why do you wish you ...",
                    style: TextStyle(fontSize: 23))
                : Text('Sent Message: ${_Textcontroller.value.text}'),
            Container(height: 20),
            Container(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text("1.  "),
                  Container(
                    width: 200,
                    height: 50,
                    child: TextFormField(
                      controller: _Textcontroller,
                      minLines: 2,
                      maxLines: 5,
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
