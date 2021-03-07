import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../theme.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FadeAnimation(
                1.0,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: themeProvider.themeMode().gradient[6],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Add Item",
                    style: themeProvider.isLightTheme
                        ? Constants.buttonLightThemeText
                        : Constants.buttonDarkThemeText,
                  ),
                )),
            FadeAnimation(
                1.1,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: themeProvider.themeMode().gradient[7],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Add Service",
                      style: themeProvider.isLightTheme
                          ? Constants.buttonLightThemeText
                          : Constants.buttonDarkThemeText),
                )),
            FadeAnimation(
                1.2,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: themeProvider.themeMode().gradient[8],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Add Auction",
                    style: themeProvider.isLightTheme
                        ? Constants.buttonLightThemeText
                        : Constants.buttonDarkThemeText,
                  ),
                )),
            FadeAnimation(
                1.3,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: themeProvider.themeMode().gradient[9],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Add Odd Job",
                      style: themeProvider.isLightTheme
                          ? Constants.buttonLightThemeText
                          : Constants.buttonDarkThemeText),
                )),
            FadeAnimation(
                1.35,
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: themeProvider.themeMode().gradient[10],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Add Collection",
                      style: themeProvider.isLightTheme
                          ? Constants.buttonLightThemeText
                          : Constants.buttonDarkThemeText),
                )),
          ],
        ),
      ),
    );
  }
}
