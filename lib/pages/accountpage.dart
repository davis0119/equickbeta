import 'package:easy_quick/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: <Widget>[
            Center(child: Text("Account Page")),
            Center(
              child: Column(
                children: <Widget>[
                ],
              ),
            ),
            Positioned(
              right: 10,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openEndDrawer();
                  },
              ),
            ),
          ],
        ),
        endDrawer: SideDrawer(),
      ),
    );
  }
}
