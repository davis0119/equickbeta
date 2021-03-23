import 'package:easy_quick/pages/savedpage.dart';
import 'package:easy_quick/pages/settings_page.dart';
import 'package:easy_quick/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';
import '../constants.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final AuthService _auth = AuthService();
    return Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: CircleAvatar(
                backgroundColor: themeProvider.themeData(context).backgroundColor,
              ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: themeProvider.themeMode().iconColor,
            ),
            title: Text('Saved',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SavedPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                color: themeProvider.themeMode().iconColor),
            title: Text('Settings',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card,
                color: themeProvider.themeMode().iconColor),
            title: Text('Payments',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart,
                color: themeProvider.themeMode().iconColor),
            title: Text('Cart',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.info_outline,
                color: themeProvider.themeMode().iconColor),
            title: Text('Account Information',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.logout,
                color: themeProvider.themeMode().iconColor),
            title: Text('Sign Out',
                style: themeProvider.isLightTheme
                    ? Constants.itemTitleLightThemeText
                    : Constants.itemTitleDarkThemeText),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: Text('Sign Out?'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('No'),
                      onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                    ),
                    CupertinoDialogAction(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                        _auth.signOut();
                    },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
