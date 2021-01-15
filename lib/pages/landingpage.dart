import 'package:easy_quick/pages/homepage.dart';
import 'package:easy_quick/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'loginpage.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          //if snapshot has error
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          // Connection Initialized - Firebase App is running
          if (snapshot.connectionState == ConnectionState.done) {

            // StreamBuilder cna check the login state live
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamsnapshot) {
                  //if snapshot has error
                  if (streamsnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${streamsnapshot.error}"),
                      ),
                    );
                  }

                  // Connection State active - Do the user login check inside the
                  // if statement
                  if(streamsnapshot.connectionState == ConnectionState.active) {
                    // Get the user
                    User _user = streamsnapshot.data;

                    // If the user is null, we're not logged in
                    if(_user == null) {
                      // the user is not logged in, head to log in page
                      return WelcomePage();
                    } else {
                      //the user is logged in, head to homepage
                      return WelcomePage();
                    }
                  }

                  // Checking the auth state - Loading
                  return Scaffold(
                    body: Center(
                      child: Text(
                        "Loading . . .",
                        style: GoogleFonts.cabinSketch(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ), //can add Loading Indicator here later
                    ),
                  );
                },
            );
          }

          //Connecting to Firebase - Loading
          return Scaffold(
            body: Center(
              child: Text(
                "Initialization App...",
                style: GoogleFonts.cabinSketch(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                  color: Colors.black,
                ),
              ), //can add Loading Indicator here later
            ),
          );
        });
  }
}
