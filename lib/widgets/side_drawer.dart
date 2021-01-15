import 'package:easy_quick/pages/settingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: null),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Saved', style: Constants.regularDarkText),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('saved');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: Constants.regularDarkText),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Payments', style: Constants.regularDarkText),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart', style: Constants.regularDarkText),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Account Information', style: Constants.regularDarkText),
            onTap: null,
          ),
        ],
      ),
    );
  }
}

