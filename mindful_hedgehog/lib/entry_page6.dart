import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'components/textinput2.dart';
import 'entry_page.dart';
import 'entry_page3.dart';
import 'main.dart';

class EntryPage6 extends StatefulWidget {
  final inputList;
  EntryPage6(this.inputList);
  //const EntryPage2({super.key});

  @override
  State<EntryPage6> createState() => _EntryPage6State(inputList);
}

class _EntryPage6State extends State<EntryPage6> {
  List<String> inputList = [];
  List<Widget> list = [];

  _EntryPage6State(List<String> t) {
    inputList = t;
  }

  String extractElements(List<String> list) {
    String res = '';
    for (int i = 0; i < list.length; i++) {
      res += list[i] + ',';
    }
    return res;
  }

  Widget returnWidget(int i) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text('$i. What would you be willing to give up to be ' +
              inputList[i - 1] +
              "?"),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 65,
            child: TextFormField(
              controller: TextEditingController(),
              maxLines: 2,
              onChanged: (newValue) {},
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

  List<Widget> loopThroughList() {
    if (inputList.length > 0) {
      for (int i = 0; i < inputList.length; i++) {
        Widget t = returnWidget(i + 1);
        list.add(t);
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6"),
        actions: <Widget>[
          // Padding(
          //   padding: EdgeInsets.only(right: 20.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Get.to(EntryPage2());
          //     },
          //   ),
          // ),
          Container(
            height: 30,
            width: 60,
          ),
        ],
      ),
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

            Text(
                "Think about how you want to be " +
                    extractElements(inputList) +
                    'with those motives you didn’t quite like.',
                style: TextStyle(fontSize: 23)),
            //Is time spent comparing yourself with others or acting like something you’re not, trying to think about adding these things on to yourself worth it?
            Container(height: 20),
            Center(
              child: Container(
                child: Text(
                    "One by one, declare your independence from these things.",
                    style: TextStyle(fontSize: 23)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(MyHomePage(
                    title: '',
                  ));
                },
                child: Text('Finish Exercise'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(20, 20),
                  primary: Color.fromARGB(255, 252, 244, 173),
                  shape: RoundedRectangleBorder(),
                )),

            //

            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Column(
            //     children: [
            //       Text("1. I wish I were more... "),
            //       Container(
            //         width: MediaQuery.of(context).size.width - 10,
            //         height: 65,
            //         child: TextFormField(
            //           controller: TextEditingController(),
            //           maxLines: 2,
            //           onChanged: (newValue) {
            //             print('vv');
            //             print(inputList);
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
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {});
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
