import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'generate_logs.dart';
import 'package:get/get.dart';
import 'package:mindful_hedgehog/controllers/save_controller.dart';
import 'components/textinput.dart';
import 'entry_page2.dart';
import 'main.dart';

import 'components/textinput2.dart';

class Logs extends StatefulWidget {
  Logs();

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  List<String> inputList = [];
  List<Widget> dateWidgets = [];

  Widget generateButton(SaveController saveController, int i) {
    String dateTime;

    Widget curr = ElevatedButton(
        onPressed: () =>
            //GenerateLogs(currDate);
            Get.to(
              GenerateLogs(
                dateTime: saveController.dates[i].toString(),
              ),
            ),
        child: Text("${saveController.dates[i]}"),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(1, 1),
          primary: Color.fromARGB(255, 250, 253, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.0),
          ),
          elevation: 6.0,
        ));
    return curr;
  }

  void generateDatetimeButtons(SaveController saveController) {
    for (int i = 0; i < saveController.dates.length; i++) {
      Widget curr = generateButton(saveController, i);

      dateWidgets.add(curr);
    }
  }

  @override
  Widget build(BuildContext context) {
    SaveController saveController = Get.find();

    generateDatetimeButtons(saveController);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ...dateWidgets,
        ],
      ),
    );
  }
}
