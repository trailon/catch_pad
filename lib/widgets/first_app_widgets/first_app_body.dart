import 'package:catch_pad/bloc/activity_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstAppBodyProvider extends StatelessWidget {
  const FirstAppBodyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityFetchBloc(),
      child: const FirstAppBody(),
    );
  }
}

class FirstAppBody extends StatelessWidget {
  const FirstAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              BlocProvider.of<ActivityFetchBloc>(context).add(FetchActivity());
            },
            icon: const Icon(Icons.add)),
        BlocBuilder<ActivityFetchBloc, ActivityFetchState>(builder: (_, state) {
          return const Text("Hah");
        }),
      ],
    );
  }
}
