import 'dart:async';

import 'package:catch_pad/constants/activity_widget.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityListView extends StatefulWidget {
  const ActivityListView(
      {Key? key, required this.activities, required this.streamController})
      : super(key: key);
  final StreamController streamController;
  final List<ActivityModel> activities;
  @override
  State<ActivityListView> createState() => _ActivityListViewState();
}

class _ActivityListViewState extends State<ActivityListView> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ReorderableListView(
        shrinkWrap: true,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final ActivityModel item = widget.activities.removeAt(oldIndex);
            widget.activities.insert(newIndex, item);
          });
        },
        children: widget.activities.map((activity) {
          return ActivityCard(key: ValueKey(activity),
              activity: activity, streamController: widget.streamController);
        }).toList(),
      ),
    );
  }
}
