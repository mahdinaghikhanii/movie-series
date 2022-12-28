import 'package:flutter/material.dart';
import 'package:movie_series/common/exception.dart';

class EmptyState extends StatelessWidget {
  final AppeExeption appeExeption;
  final Function() ontap;
  const EmptyState(
      {super.key, required this.appeExeption, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/problems.png"),
        const SizedBox(height: 10),
        Text(
          appeExeption.exception.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 40,
          width: 150,
          child: ElevatedButton(
              onPressed: ontap,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: Text(
                "Refresh",
                style: Theme.of(context).textTheme.titleSmall,
              )),
        )
      ],
    ));
  }
}
