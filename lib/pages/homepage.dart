import 'package:easy_quick/pages/accountpage.dart';
import 'package:easy_quick/pages/explorepage.dart';
import 'package:easy_quick/pages/postpage.dart';
import 'package:easy_quick/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants.dart';
import 'orderspage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page")),
    );
  }
}


