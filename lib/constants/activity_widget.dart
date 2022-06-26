import 'dart:async';

import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard(
      {Key? key, required this.activity, required this.streamController})
      : super(key: key);
  ActivityModel activity;
  StreamController streamController;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(activity.type!),
        subtitle: Text(activity.participants.toString()),
        trailing: InkWell(
            onTap: () {
              streamController.add(activity);
            },
            child: Icon(Icons.favorite)),
        leading: Text(activity.price.toString()),
      ),
    );
  }
}
