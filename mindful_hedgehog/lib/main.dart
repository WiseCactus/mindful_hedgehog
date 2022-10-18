// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindful_hedgehog/check_in.dart';
import 'package:mindful_hedgehog/entry_page.dart';

import 'check_in.dart';
import 'controllers/save_controller.dart';
import 'logs.dart';

// Create storage

void main() {
  // Initializes local storage.

  Get.put(SaveController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mindful Hedgie',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.yellow),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 252, 244, 173),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(Logs());
                },
                child: Text('My Logs'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 300),
                  primary: Color.fromARGB(255, 250, 253, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 6.0,
                )),
          ),
        ],
        elevation: 0,
      ),
      body:
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        //
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).

        children: <Widget>[
          // // This is text boxt to insert variable.
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          // This box is to insert text.
          // const Text(
          //   'Hello, you have hit the counter ',
          // ),

          Container(height: 15),

          // Image.asset(
          //   'assets/bee.png',
          //   width: 240,
          //   height: 90,
          //   fit: BoxFit.fill,
          // ),
          Image.asset(
            'assets/sakura.gif',
            width: 300,
            height: 270,
            fit: BoxFit.fill,
          ),

          Text(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromARGB(255, 252, 244, 173),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 3.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 86, 3, 3),
                ),
              ],
            ),
            "🌸 Mindful Hedgehog 🌸",
            textAlign: TextAlign.center,
          ),

          Container(height: 20),
          Hero(
            tag: "HEDGIE",
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 252, 244, 173),
              child: Padding(
                padding: const EdgeInsets.all(8), // Border radius
                child: ClipOval(child: Image.asset('assets/cute5.jpg')),
              ),
            ),
          ),

          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: Image.asset('assets/cute5.png'),
          //     ),
          //     Expanded(
          //       child: Image.asset('assets/cute6.png'),
          //     ),
          //   ],
          // ),

          Container(height: 50),

          ElevatedButton(
              onPressed: () {
                Get.to(checkIn());
              },
              child: Text('Start Exercise'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(140, 60),
                primary: Color.fromARGB(255, 252, 244, 173),
                shape: RoundedRectangleBorder(),
                elevation: 9.0,
              )),

          Container(height: 30),

          //Container(height: 30),
          Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Image.asset(
              //       'assets/pocky.png',
              //       width: 80,
              //       height: 60,
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/plant.gif',
                    width: 400,
                    height: 90,
                  ),
                ],
              ),

              Container(height: 40),
            ],
          )
        ],
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
    // floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.edit),
    // ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}
