import 'package:flutter/material.dart';

class SecondApp extends StatelessWidget {
  const SecondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Scaffold(),
      ),
    );
  }
}
