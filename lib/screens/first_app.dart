import 'package:catch_pad/widgets/first_app_widgets/app_bar.dart';
import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: Scaffold(
            appBar: const FirstScreenAppBar(),
            body: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          )),
    );
  }
}
