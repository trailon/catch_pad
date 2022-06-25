import 'package:flutter/material.dart';
class FirstScreenAppBar extends StatelessWidget with PreferredSizeWidget{
  const FirstScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        actions: [
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_alt_rounded))
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => throw UnimplementedError();
}
