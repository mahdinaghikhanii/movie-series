import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final bool iconBack;
  final bool showAction;
  final IconData? actionIcon;
  final Function()? ontapAction;
  final String title;
  const CustomAppbar(
      {super.key,
      this.ontapAction,
      required this.iconBack,
      required this.title,
      this.showAction = false,
      this.actionIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: showAction
          ? [
              IconButton(
                onPressed: ontapAction,
                icon: Icon(actionIcon),
                color: Colors.white,
                iconSize: 24,
              )
            ]
          : null,
      leading: iconBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 20,
            )
          : null,
      title: Text(title,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
