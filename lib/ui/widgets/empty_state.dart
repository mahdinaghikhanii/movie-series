import 'package:flutter/material.dart';
import 'package:movie_series/common/exception.dart';

class EmptyState extends StatelessWidget {
  final AppeExeption appeExeption;
  const EmptyState({super.key, required this.appeExeption});

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
      ],
    ));
  }
}
