// ignore_for_file: must_be_immutable

import 'package:catch_pad/constants/activity_widget.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter/material.dart';

class SecondApp extends StatelessWidget {
  SecondApp({Key? key, required this.favoriteActivities})
      : super(key: key);
  List<ActivityModel> favoriteActivities;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          body: ListView(
            children: favoriteActivities.map((favActivity) {
              return ActivityCard(activity: favActivity);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
