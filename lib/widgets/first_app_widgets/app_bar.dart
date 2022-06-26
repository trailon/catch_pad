import 'package:flutter/material.dart';

class FirstScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FirstScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title:
            InkWell(onTap: () {
              // Opens Filters Screen
            }, child: const Icon(Icons.filter_alt_rounded)),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight / 2);
}
