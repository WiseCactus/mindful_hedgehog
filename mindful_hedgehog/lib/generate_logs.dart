import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:mindful_hedgehog/controllers/save_controller.dart';
import 'components/textinput.dart';
import 'entry_page2.dart';
import 'main.dart';

import 'components/textinput2.dart';

class GenerateLogs extends StatefulWidget {
  final String dateTime;

  GenerateLogs({required this.dateTime});

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<GenerateLogs> createState() => _GenerateLogsState(this.dateTime);
}

class _GenerateLogsState extends State<GenerateLogs> {
  List<String> inputList = [];
  List<Widget> dateWidgets = [];
  String dateTime;
  _GenerateLogsState(this.dateTime);

  List<String> getList(
      SaveController saveController, String dateTime, String subset) {
    List<String> result =
        saveController.getList('${dateTime.toString()} ${subset}');

    return result;
  }

  List<List<String>> getNested(
      SaveController saveController, String dateTime, String subset) {
    List<List<String>> result =
        saveController.getNestedList('${dateTime.toString()} ${subset}');

    return result;
  }

  @override
  Widget build(BuildContext context) {
    SaveController saveController = Get.find();

    List<String> moodsForDate = getList(saveController, dateTime, "CHECKIN");
    List<String> input1ForDate = getList(saveController, dateTime, "INPUT1");
    List<String> input2ForDate = getList(saveController, dateTime, "INPUT2");
    List<List<String>> input3ForDate =
        getNested(saveController, dateTime, "INPUT3");
    List<String> input4ForDate = getList(saveController, dateTime, "INPUT4");
    List<String> input5ForDate = getList(saveController, dateTime, "INPUT5");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Text("Mood(s) for ${dateTime}", style: TextStyle(fontSize: 23)),
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: moodsForDate.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(moodsForDate[index]);
                  }),
            ),
            Text("Input 1 for ${dateTime}", style: TextStyle(fontSize: 23)),
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: input1ForDate.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(input1ForDate[index]);
                  }),
            ),
            Text("Input 2 for ${dateTime}", style: TextStyle(fontSize: 23)),
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: input2ForDate.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(input2ForDate[index]);
                  }),
            ),
            Text("Input 3 for ${dateTime}", style: TextStyle(fontSize: 23)),
            Column(
              children: <Widget>[
                Container(
                  width: 500,
                  height: 20,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: input3ForDate.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Text(input3ForDate[index][0]);
                      }),
                ),
                Container(
                  width: 500,
                  height: 20,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: input3ForDate.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Text(input3ForDate[index][1]);
                      }),
                ),
              ],
            ),
            Text("Input 4 for ${dateTime}", style: TextStyle(fontSize: 23)),
            Container(
              height: 10,
              width: 10,
              child: ListView.builder(
                  itemCount: input4ForDate.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(input4ForDate[index]);
                  }),
            ),
            Text("Input 5 for ${dateTime}", style: TextStyle(fontSize: 23)),
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                  itemCount: input5ForDate.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(input5ForDate[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
