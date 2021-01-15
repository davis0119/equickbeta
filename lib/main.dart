import 'package:easy_quick/pages/landingpage.dart';
import 'package:easy_quick/pages/loginpage.dart';
import 'package:easy_quick/pages/savedpage.dart';
import 'package:easy_quick/pages/settingspage.dart';
import 'package:easy_quick/pages/welcome_page.dart';
import 'package:easy_quick/widgets/navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/pages/homepage.dart';
import 'package:easy_quick/pages/loadingpage.dart';
import 'package:easy_quick/pages/explorepage.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

 // initialRoute: '/', //loading screen is the first screen to pop up
  //routes: { //different screens
   // '/': (context) => LoadingPage(),
    //'/homepage': (context) => Homepage(),
    //'/explorePage' : (context) => ExplorePage(),

  //},
//));



