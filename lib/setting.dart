import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes/themes/app_themes.dart';
import 'package:themes/themes/theme_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void _showThemeOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  title: const Text('Use Dynamic Color'),
                  value: themeProvider.useDynamicColor,
                  onChanged: (value) {
                    themeProvider.toggleDynamicColor();
                    Navigator.pop(context);
                  },
                ),
                ...AppThemes.themes.map((theme) => ListTile(
                      title: Text(theme.name),
                      onTap: () {
                        themeProvider.setTheme(theme);
                        Navigator.pop(context);
                      },
                      selected: themeProvider.currentTheme.name == theme.name,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(
              "Themes",
              style: TextStyle(
                  // color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            // tileColor: Color.fromARGB(197, 207, 183, 109),
            onTap: () {
              _showThemeOptions(context);
            },
          ),
        ],
      ),
    );
  }
}
