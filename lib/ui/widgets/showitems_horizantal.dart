import 'package:flutter/material.dart';

class ShowItemsHorizantal extends StatelessWidget {
  const ShowItemsHorizantal({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Container();
      },
    );
  }
}
