import 'package:flutter/material.dart';

class AppTheme {
  final String name;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  AppTheme(
      {required this.name, required this.lightTheme, required this.darkTheme});
}

class AppThemes {
  static final List<AppTheme> themes = [
    AppTheme(
      name: 'System',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    ),
    AppTheme(
      name: 'Light',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
    ),
    AppTheme(
      name: 'Dark',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    ),
    AppTheme(
      name: 'AMOLED',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
          surface: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
          surface: Colors.black,
        ),
      ),
    ),
    // AppTheme(
    //   name: 'One UI',
    //   lightTheme: ThemeData(
    //     useMaterial3: true,
    //     brightness: Brightness.light,
    //     colorScheme: ColorScheme.fromSeed(
    //       seedColor: Colors.black,
    //       brightness: Brightness.light,
    //     ),
    //   ),
    //   darkTheme: ThemeData(
    //       useMaterial3: true,
    //       brightness: Brightness.dark,
    //       scaffoldBackgroundColor: Colors.black,
    //       colorScheme: ColorScheme.fromSeed(
    //         seedColor: Colors.white,
    //         brightness: Brightness.dark,
    //         primary: Colors.white,
    //         background: Colors.black,
    //         surface: Colors.black, // App bar
    //       ),
    //       listTileTheme: ListTileThemeData(
    //           tileColor: const Color.fromARGB(255, 146, 70, 70),
    //           shape: BeveledRectangleBorder(
    //               borderRadius: BorderRadius.circular(30)))),
    // ),
    AppTheme(
      name: 'purple',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
    ),
    AppTheme(
      name: 'Orange',
      lightTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
    ),
  ];

  static AppTheme getThemeByName(String name) {
    return themes.firstWhere((theme) => theme.name == name,
        orElse: () => themes.first);
  }
}
