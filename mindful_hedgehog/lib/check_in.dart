import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'components/textinput2.dart';
import 'controllers/save_controller.dart';
import 'entry_page.dart';
import 'entry_page3.dart';
import 'labelled_checkbox.dart';
import 'main.dart';

class checkIn extends StatefulWidget {
  checkIn();
  //const EntryPage2({super.key});

  @override
  State<checkIn> createState() => _checkInState();
}

class _checkInState extends State<checkIn> {
  List<String> moodsList = [];

  bool _sadIsSelected = false;
  bool _happyIsSelected = false;
  bool _insecureIsSelected = false;
  bool _anxiousIsSelected = false;
  bool _angryIsSelected = false;
  bool _gratefulIsSelected = false;
  bool _confusedIsSelected = false;
  bool _excitedIsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                // for (int i = 0; i < inputList.length; i++) {
                //   int val = i + 1;
                //   String key = "Input 1 Value " + val.toString();

                //   storage.writeSecureData(key, (inputList[i]).toString());
                //   // storage.write(key: key, value: value);
                // }
                //String value = await storage.read(key: key);

                //TODO : move

                SaveController saveController = Get.find();

                DateTime date = DateTime.now();

                String now = date.toString().split(" ")[0];
                if (saveController.dates.contains(now) == false) {
                  saveController.dates.add(now);
                }

                saveController.saveValue("date", now);
                saveController.saveList('${now.toString()} CHECKIN', moodsList);

                Get.to(EntryPage());
              },
            ),
          ),

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

            Text("Before we start, how is your mood today?",
                style: TextStyle(fontSize: 23)),
            //Is time spent comparing yourself with others or acting like something you’re not, trying to think about adding these things on to yourself worth it?
            Container(height: 20),
            Center(
              child: Container(
                child: Text("I am feeling ... (check all that apply)",
                    style: TextStyle(fontSize: 23)),
              ),
            ),

            // Labels.
            LabeledCheckbox(
              label: 'Sad',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _sadIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _sadIsSelected = newValue;
                  if (moodsList.contains("Sad") == false) {
                    moodsList.add("Sad");
                  }
                });
              },
            ),

            LabeledCheckbox(
              label: 'Happy',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _happyIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _happyIsSelected = newValue;
                  if (moodsList.contains("Happy") == false) {
                    moodsList.add("Happy");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Grateful',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _gratefulIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _gratefulIsSelected = newValue;
                  if (moodsList.contains("Grateful") == false) {
                    moodsList.add("Grateful");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Excited',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _excitedIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _excitedIsSelected = newValue;
                  if (moodsList.contains("Excited") == false) {
                    moodsList.add("Excited");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Confused',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _confusedIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _confusedIsSelected = newValue;
                  if (moodsList.contains("Confused") == false) {
                    moodsList.add("Confused");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Angry',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _angryIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _angryIsSelected = newValue;
                  if (moodsList.contains("Angry") == false) {
                    moodsList.add("Angry");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Insecure',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _insecureIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _insecureIsSelected = newValue;
                  if (moodsList.contains("Insecure") == false) {
                    moodsList.add("Insecure");
                  }
                });
              },
            ),
            LabeledCheckbox(
              label: 'Anxious',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _anxiousIsSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _anxiousIsSelected = newValue;
                  if (moodsList.contains("Anxious") == false) {
                    moodsList.add("Anxious");
                  }
                });
              },
            ),

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
