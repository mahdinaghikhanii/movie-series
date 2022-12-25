import 'package:flutter/material.dart';
import 'package:movie_series/theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/search.png"),
            const SizedBox(height: 20),
            Text(
              "we are sorry, we can\nnot find the movie :(",
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
