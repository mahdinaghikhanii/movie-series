import 'package:flutter/material.dart';

import '../../common/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.padingdefultSize),
                        child: Text(
                          "What do you want to watch ?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  );

                default:
                  return Container();
              }
            }));
  }
}
