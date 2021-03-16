import 'package:easy_quick/pages/explorepage.dart';
import 'package:easy_quick/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/Models/user.dart';

import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // accessing user data from provider
    final user = Provider.of<User>(context);

    // return either Explore Page or Welcome Page
    if (user == null) {
      return WelcomePage();
    } else {
      return ExplorePage();
    }
  }
}
