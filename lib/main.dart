import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'theme.dart';
import 'ui/root.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
