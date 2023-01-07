import 'package:flutter/material.dart';
import 'package:movie_series/common/dimensions.dart';

class DeleteItemAnimation extends StatelessWidget {
  const DeleteItemAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.padingdefultSize),
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
