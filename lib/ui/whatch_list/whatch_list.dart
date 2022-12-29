import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../../theme.dart';

class WhatchListScreen extends StatelessWidget {
  const WhatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(iconBack: false, title: "Watch list"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/img/box.png"),
            const SizedBox(height: 20),
            Text(
              "There is no movie yet!",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Find your movie by Type title,\ncategories, years, etc",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: LightThemeColor.primaryColor, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
