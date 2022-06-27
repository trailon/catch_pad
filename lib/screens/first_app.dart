// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:catch_pad/cubit/url_cubit_cubit.dart';
import 'package:catch_pad/widgets/first_app_widgets/app_bar.dart';
import 'package:catch_pad/widgets/first_app_widgets/first_app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstApp extends StatelessWidget {
  FirstApp({Key? key,required this.streamController}) : super(key: key);
  StreamController streamController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: BlocProvider(
            create: (context) => UrlCubit(),
            child: Scaffold(
              appBar: const FirstScreenAppBar(),
              body: FirstAppBodyProvider(streamController: streamController),
            ),
          )),
    );
  }
}
