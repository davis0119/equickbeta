import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/pages/loginpage.dart';
import 'package:easy_quick/pages/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/theme.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/services/auth.dart';
import '../constants.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          child: Form(
            key: _formKey,
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
                              1.15,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Email',
                                  style: themeProvider.isLightTheme
                                      ? Constants.linkLightThemeText
                                      : Constants.linkDarkThemeText,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: themeProvider.themeMode().gradient[0],
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
                            ),
                          ),
                          FadeAnimation(
                              1.2,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'New Password',
                                  style: themeProvider.isLightTheme
                                      ? Constants.linkLightThemeText
                                      : Constants.linkDarkThemeText,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: themeProvider.themeMode().gradient[0],
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
                            ),
                          ),
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
      ),
    );
  }
}
