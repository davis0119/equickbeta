import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/constants.dart';
import 'package:easy_quick/pages/registerpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Welcome", style: GoogleFonts.cabinSketch(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                    color: Colors.black,
                  ))),
                  SizedBox(height: 20,),
          FadeAnimation(1.1, Text(
                    "Login to your account or create a new account!",
                    textAlign: TextAlign.center,
                    style: Constants.regularLightText,
                  )),
                ],
              ),
        FadeAnimation(1.2, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcomeillustration.png'),
                  ),
                ),
              )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.3, MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.greenAccent,
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(color: Colors.black,),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("Login", style: Constants.buttonDarkText,
                    ),
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.yellow,
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterPage()));
                    },
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.black,),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign Up",
                      style: Constants.buttonDarkText,
                    ),
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
