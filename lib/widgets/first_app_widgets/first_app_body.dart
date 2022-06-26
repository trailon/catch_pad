import 'dart:async';

import 'package:catch_pad/bloc/activity_fetch_bloc.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:catch_pad/widgets/first_app_widgets/activity_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FirstAppBodyProvider extends StatelessWidget {
  FirstAppBodyProvider({Key? key, required this.streamController}) : super(key: key);
  StreamController streamController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityFetchBloc(),
      child: FirstAppBody(streamController: streamController),
    );
  }
}

// ignore: must_be_immutable
class FirstAppBody extends StatelessWidget {
  FirstAppBody({Key? key, required this.streamController}) : super(key: key);
  StreamController streamController;
  List<ActivityModel> activities = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              BlocProvider.of<ActivityFetchBloc>(context).add(FetchActivity());
            },
            icon: const Icon(Icons.add)),
        BlocBuilder<ActivityFetchBloc, ActivityFetchState>(builder: (_, state) {
          if (state is ActivityFetchInitial) {
            return const Text("There is no Activity");
          }
          // In loading state show all the current activities and a proggress indicatior at the bottom of the listview
          else if (state is ActivityFetchLoading) {
            return Flexible(
                child: Column(children: [
              ActivityListView(activities: activities,streamController: streamController),
              const CircularProgressIndicator.adaptive()
            ]));
            // As activity being loaded add the fetched activity to the activity list variable and return the reorderableview
          } else if (state is ActivityFetchLoaded) {
            activities.add(state.activity);
            return ActivityListView(activities: activities,streamController: streamController);
            // If any error occurs during fetching the data return the current activities with an error text at the bottom of the listview
          } else if (state is ActivityFetchError) {
            return Flexible(
                child: Column(children: [
              ActivityListView(activities: activities,streamController: streamController),
              Text(state.message!)
            ]));
          } else {
            return const Text("There is no connection");
          }
        }),
      ],
    );
  }
}
