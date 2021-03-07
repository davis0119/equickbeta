import 'package:easy_quick/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeData(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: themeProvider.themeMode().iconColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        title: Text('Settings',
            style: themeProvider.isLightTheme
                ? Constants.lightThemeHeading
                : Constants.darkThemeHeading),
      ),
      body: Card(
        //color: themeProvider.themeData(context).primaryColor,
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: !themeProvider.isLightTheme,
          activeColor: themeProvider.themeMode().gradient[3],
          inactiveTrackColor: Colors.grey,
          onChanged: (bool value) {
            setState(() {
              themeProvider.toggleThemeData();
            });
          },
          secondary: Icon(Icons.brightness_4),
        ),
      ),
    );
  }
}
