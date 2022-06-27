import 'package:catch_pad/widgets/first_app_widgets/filter_dialog.dart';
import 'package:flutter/material.dart';

class FirstScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FirstScreenAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: InkWell(
            onTap: () {
              // Opens Filters Screen
              showDialog(
                  context: context,
                  builder: (_) {
                    return FilterDialog(urlCubitContext: context);
                  });
            },
            child: const Icon(Icons.filter_alt_rounded)),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight / 2);
}
