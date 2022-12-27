import 'package:flutter/material.dart';

class CategoryMovieInformation extends StatelessWidget {
  final String title;
  final IconData iconData;
  const CategoryMovieInformation(
      {super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: const Color(0xFF92929D),
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: const Color(0xFF92929D)),
        ),
      ],
    );
  }
}
