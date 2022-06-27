// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:catch_pad/constants/texts.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:catch_pad/screens/first_app.dart';
import 'package:catch_pad/screens/second_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final StreamController<ActivityModel> streamController =
      StreamController.broadcast();
  List<ActivityModel> favoriteActivities = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Row(      // 2 Seperated Material Apps is called in one
        children: [
          Expanded(
              child: FirstApp(
            streamController: streamController,
          )),
          StreamBuilder<ActivityModel>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && !favoriteActivities.contains(snapshot.data)) {
                  favoriteActivities.add(snapshot.data!);
                }
                return Expanded(
                    child: SecondApp(
                  favoriteActivities: favoriteActivities,
                ));
              }),
        ],
      ),
    );
  }
}
