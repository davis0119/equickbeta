import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/pages/loginpage.dart';
import 'package:easy_quick/widgets/custom_button.dart';
import 'package:easy_quick/widgets/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Build an alert dialog to display some errors
  // Maybe replace with a Snackbar
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // button has to be clicked to dismiss message when false
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Error",
            style: Constants.regularDarkText,
          ),
          content: Container(
            child: Text(
                error,
              style: Constants.regularDarkText,
            ),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close", style: Constants.buttonDarkText)
            )
          ],
        );
      },
    );
  }

  // Create a new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail,
          password: _registerPassword,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {

    // Set the form to loading state
    setState(() {
      _registerFormLoading = true;
    });

    // Run the create account method
    String _createAccountFeedback = await _createAccount();

    // If the string is not null, we got error while creating the account
    if(_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback); // tells what the error is in the dialog

      // Set the form to regular state (not loading)
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      // User created account successfully navigate to different page
      Navigator.pop(context);
    }
  }

  // Default Form Loading State
  bool _registerFormLoading = false;

  // Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // FocusNode for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Sign Up", style: GoogleFonts.cabinSketch(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                    color: Colors.black,
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.05, Text("Create your account", style: Constants.regularLightText,),),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.1, makeInput(label: "Email")),
                  FadeAnimation(1.15, makeInput(label: "Password", obscureText: true)),
                  FadeAnimation(1.2, makeInput(label: "Confirm Password", obscureText: true)),
                ],
              ),
              Column(
                children: [
                  FadeAnimation(1.3, Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        //_submitForm();
                        Navigator.push(context,  CupertinoPageRoute(builder: (context) => LoginPage()));
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                          "Sign Up",
                          style: Constants.buttonDarkText,
                      ),
                    ),
                  )),
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?  Login", style: Constants.regularDarkText,),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label, style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400],)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400],),
          ),
        ),
      ),
      SizedBox(height: 30,),
    ],
  );
}


// Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                     top: 24.0
//                 ),
//                 child: Text(
//                   "Heading",
//                   textAlign: TextAlign.center,
//                   style: Constants.boldHeading,
//                 ),
//               ), // Heading
//               Column(
//                   children: [
//                     CustomInput(
//                       hintText: "Email...",
//                       onChanged: (value) {
//                         _registerEmail = value;
//                       },
//                       onSubmitted: (value) {
//                         _passwordFocusNode.requestFocus(); // once email is submitted focus changes to password field
//                       },
//                       textInputAction: TextInputAction.next,
//                     ),
//                     CustomInput(
//                       hintText: "Password...",
//                       onChanged: (value) {
//                         _registerPassword = value;
//                       },
//                       focusNode: _passwordFocusNode,
//                       obscureText: true,
//                       onSubmitted: (value) {
//                         _submitForm();
//                       },
//                     ),
//                     CustomBtn(
//                       text: "Create New Account",
//                       onPressed: () {
//                         _submitForm();
//                       },
//                       outlineBtn: false,
//                       isLoading: _registerFormLoading,
//                     ), // Create New Account Button
//                   ]
//               ),
//               CustomBtn(
//                 text: "Back to Login",
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 outlineBtn: true,
//               ), // Back to Login Button
//             ],
//           ),
//         ),
//       ),
//     )