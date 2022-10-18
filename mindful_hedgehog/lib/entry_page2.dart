import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'components/textinput2.dart';
import 'controllers/save_controller.dart';
import 'entry_page.dart';
import 'entry_page3.dart';

class EntryPage2 extends StatefulWidget {
  final inputList;
  EntryPage2(this.inputList);
  //const EntryPage2({super.key});

  @override
  State<EntryPage2> createState() => _EntryPage2State(inputList);
}

class _EntryPage2State extends State<EntryPage2> {
  List<String> inputList = [];
  List<Widget> list = [];
  List<String> res = [];

  _EntryPage2State(List<String> t) {
    inputList = t;
  }

  Widget returnWidget(int i) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text('$i. Why do you want to be ' + inputList[i - 1] + "?"),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 65,
            child: TextFormField(
              controller: TextEditingController(),
              maxLines: 2,
              onChanged: (newValue) {
                if (res.isEmpty) {
                  res.add('');
                  res[0] = newValue;
                } else {
                  res.add('');
                  res[i - 1] = newValue;
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
        title: Text("Step 2"),
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
                saveController.saveList('${now.toString()} INPUT2', res);

                Get.to(EntryPage3(inputList));
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

            Text("  Now ask yourself...", style: TextStyle(fontSize: 23)),

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
