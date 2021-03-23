import 'package:easy_quick/pages/welcome_page.dart';
import 'package:easy_quick/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/Models/user.dart' as model;
import 'package:firebase_core/firebase_core.dart';


class Wrapper extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // accessing user data from provider
    final user = Provider.of<model.User>(context);

    // return either Explore Page or Welcome Page
    if (user == null) {
      return WelcomePage();
    } else {
      return Navigation();
    }
  }
}
