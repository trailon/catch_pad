import 'dart:async';

import 'package:catch_pad/constants/texts.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard({Key? key, required this.activity, this.streamController})
      : super(key: key);
  ActivityModel activity;
  StreamController? streamController;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(activity.activity!, textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  Text("${activity.participants}")
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.price_check_sharp),
                  Column(children: [
                    Text("${activity.price! * 200} \$"),
                    Text("${activity.price! * 400} ₺"),
                  ])
                ],
              ),
            ],
          ),
          Text("${Strings.type}: ${activity.type!}"),
          (streamController != null)
              ? InkWell(
                  onTap: () {
                    streamController!.add(activity);
                  },
                  child: const Icon(Icons.favorite))
              : Container()
        ],
      ),
    );
  }
}
