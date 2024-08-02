import 'package:flutter/material.dart';
import 'package:themes/setting.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:themes/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //1-add theme folder in your project
  //2- Add this method in your project
  //3- call method when you tap

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            final useDynamicColor = themeProvider.useDynamicColor;
            final currentTheme = themeProvider.currentTheme;

            ThemeData lightTheme = useDynamicColor && lightDynamic != null
                ? ThemeData(colorScheme: lightDynamic, useMaterial3: true)
                : currentTheme.lightTheme;

            ThemeData darkTheme = useDynamicColor && darkDynamic != null
                ? ThemeData(colorScheme: darkDynamic, useMaterial3: true)
                : currentTheme.darkTheme;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: currentTheme.name == 'System'
                  ? ThemeMode.system
                  : currentTheme.name == 'Light'
                      ? ThemeMode.light
                      : ThemeMode.dark,
              home: const Setting(),
            );
          },
        );
      },
    );
  }
}
