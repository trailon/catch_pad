import 'package:catch_pad/screens/first_app.dart';
import 'package:catch_pad/screens/second_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatchPad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Row(
        children: const [
          // 2 Seperated Material Apps is called in one
          Expanded(child: FirstApp()),
          Expanded(child: SecondApp()),
        ],
      ),
    );
  }
}
