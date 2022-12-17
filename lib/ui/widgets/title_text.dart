import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String titleText;
  final TextStyle? style;
  const TitleText({super.key, required this.titleText, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: style ?? Theme.of(context).textTheme.titleSmall,
    );
  }
}
