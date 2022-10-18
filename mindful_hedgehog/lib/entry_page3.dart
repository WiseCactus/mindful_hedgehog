import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'components/textinput2.dart';
import 'controllers/save_controller.dart';
import 'entry_page.dart';
import 'entry_page3.dart';
import 'entry_page4.dart';

class EntryPage3 extends StatefulWidget {
  final inputList;
  EntryPage3(this.inputList);
  //const EntryPage2({super.key});

  @override
  State<EntryPage3> createState() => _EntryPage3State(inputList);
}

class _EntryPage3State extends State<EntryPage3> {
  List<String> inputList = [];
  List<Widget> list = [];
  List<List<String>> res = [];

  _EntryPage3State(List<String> t) {
    inputList = t;
  }

  Widget returnWidget(int i) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          // ", and what is leading you to think that
          Text('$i. How much happier would you be if you were ' +
              inputList[i - 1] +
              "? "),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 65,
            child: TextFormField(
              controller: TextEditingController(),
              maxLines: 2,
              onChanged: (newValue) {
                res.add([]);
                res[i - 1].add("");
                res[i - 1][0] = newValue;
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
          Container(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'Why do you to think that being ' +
                  inputList[i - 1] +
                  " would make you happier?",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 65,
            child: TextFormField(
              controller: TextEditingController(),
              maxLines: 2,
              onChanged: (newValue) {
                res[i - 1].add('');
                res[i - 1][1] = (newValue);
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
        title: Text("Step 3"),
        actions: <Widget>[
          Container(
            height: 30,
            width: 60,
            child: IconButton(
              icon: Icon(
                (Icons.keyboard_arrow_right_outlined),
                size: 40.0,
              ),
              onPressed: () {
                SaveController saveController = Get.find();

                DateTime date = DateTime.now();

                String now = date.toString().split(" ")[0];
                print(res);
                saveController.saveNestedList('${now.toString()} INPUT3', res);

                Get.to(EntryPage4(inputList));
              },
            ),
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

            Text("  Now imagine that you had all these things on your list.",
                style: TextStyle(fontSize: 23)),

            Container(height: 20),
            Container(height: 20),

            Column(
              children: <Widget>[
                ...loopThroughList(),
              ],
            ),

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
