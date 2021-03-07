import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/pages/loginpage.dart';
import 'package:easy_quick/pages/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/theme.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  // Build an alert dialog to display some errors
  // Replace with a SnackBar
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      // button has to be clicked to dismiss message when false
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text(error),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close Dialog"))
          ],
        );
      },
    );
  }

  // Login user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
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
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while creating the account
    if (_loginFeedback != null) {
      _alertDialogBuilder(
          _loginFeedback); // tells what the error is in the dialog

      // Set the form to regular state (not loading)
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: themeProvider.themeData(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeProvider.themeData(context).backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: themeProvider.themeMode().iconColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                        1,
                        Text("Forget Password",
                            style: themeProvider.isLightTheme
                                ? Constants.authLightThemePageTitle
                                : Constants.authDarkThemePageTitle),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.1,
                        Text("Create a new password",
                            style: themeProvider.isLightTheme
                                ? Constants.authDescriptionLightThemeText
                                : Constants.authDescriptionDarkThemeText),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.15, makeInput(label: "Email", context: context)),
                        FadeAnimation(
                            1.2,
                            makeInput(
                                label: "New Password",
                                obscureText: true,
                                context: context)),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.3,
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Container(
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              //_submitForm();
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            color: themeProvider.themeMode().gradient[2],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Change Password",
                              style: themeProvider.isLightTheme
                                  ? Constants.buttonLightThemeText
                                  : Constants.buttonDarkThemeText,
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                      1.4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account? Sign Up",
                            style: themeProvider.isLightTheme
                                ? Constants.linkLightThemeText
                                : Constants.linkDarkThemeText,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            icon: Icon(Icons.arrow_forward_ios,
                                size: 20,
                                color: themeProvider.themeMode().iconColor),
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

Widget makeInput({label, obscureText = false, BuildContext context}) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: themeProvider.isLightTheme
            ? Constants.linkLightThemeText
            : Constants.linkDarkThemeText,
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: themeProvider.themeMode().gradient[2],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: themeProvider.themeMode().backgroundColor,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
