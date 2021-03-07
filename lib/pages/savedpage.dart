import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../theme.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
        title: Text('Saved', style: themeProvider.isLightTheme ? Constants.lightThemeHeading : Constants.darkThemeHeading),
      ),
      body: Center(
        child: Text('Dummy Page'),
      ),
    );
  }
}
