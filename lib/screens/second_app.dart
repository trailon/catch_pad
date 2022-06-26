import 'dart:math';

import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter/material.dart';

class SecondApp extends StatelessWidget {
  SecondApp({Key? key, this.activity,required this.favoriteActivities}) : super(key: key);
  ActivityModel? activity;
  List<ActivityModel> favoriteActivities;
  @override
  Widget build(BuildContext context) {
    /* if (activity != null && !favoriteActivities.contains(activity)) {
      favoriteActivities.add(activity!);
    } */
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: favoriteActivities.map((favActivity) {
              return Card(
                  child:
                      ListTile(title: Text(favActivity.activity.toString())));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
