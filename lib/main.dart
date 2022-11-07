import 'package:flutter/material.dart';
import 'package:movie_series/common/app_constans.dart';
import 'package:movie_series/common/http_client.dart';
import 'package:movie_series/data/source/top_rated_data_source.dart';

import 'package:movie_series/theme.dart';
import 'package:movie_series/ui/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        " ${AppConstans.baseUrl} '${AppConstans.baseUrlForMovie} ${AppConstans.topRatedMovie} ${AppConstans.apiKey}');");
    TopRatedDataSource(httpClint)
        .getTopRated()
        .then((value) => debugPrint(value.toString()));
    return MaterialApp(
        title: 'Movie series',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
                titleMedium: TextStyle(
                    color: LightThemeColor.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(
                  color: LightThemeColor.selectedColor,
                ),
                unselectedItemColor: LightThemeColor.primaryColor,
                backgroundColor: LightThemeColor.scafoldBackGroundColor),
            scaffoldBackgroundColor: LightThemeColor.scafoldBackGroundColor),
        home: const RootScrean());
  }
}
