import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:mindful_hedgehog/controllers/save_controller.dart';
import 'components/textinput.dart';
import 'entry_page2.dart';
import 'main.dart';

import 'components/textinput2.dart';

class EntryPage extends StatefulWidget {
  EntryPage();

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  List<String> inputList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 1"),
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
                List<String> remove = [];
                for (int i = 0; i < inputList.length; i++) {
                  if (inputList[i] == '') {
                    remove.add(inputList[i]);
                  }
                }

                for (int i = 0; i < remove.length; i++) {
                  inputList.remove(remove[i]);
                }
                SaveController saveController = Get.find();

                DateTime date = DateTime.now();

                String now = date.toString().split(" ")[0];

                saveController.saveList('${now.toString()} INPUT1', inputList);
                print('${date.toString()} INPUT1');

                if (inputList.isNotEmpty) {
                  Get.to(EntryPage2(inputList));
                } else {
                  SizedBox(child: Text("Please enter in at least one box."));
                }
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: MultiLineTextField(inputList),
      ),
    );
  }
}
