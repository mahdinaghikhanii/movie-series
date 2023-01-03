import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_series/data/entity/resultItem_movie.dart';

import 'theme.dart';
import 'ui/root.dart';

const taskBoxName = "TASK";

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(ResultItemMovieEntityAdapter());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox<ResultItemMovieEntity>(taskBoxName);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie series',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: LightThemeColor.scafoldBackGroundColor),
            textTheme: const TextTheme(
                bodyMedium:
                    TextStyle(color: Colors.white, height: 1.5, fontSize: 15),
                titleSmall: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
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
