import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/pages/registerpage.dart';
import 'package:easy_quick/services/auth.dart';
import 'package:easy_quick/widgets/loading.dart';
import 'package:easy_quick/widgets/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../theme.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String confirmPassword = '';

  String error = '';

  // Default Form Loading State
  bool _registerFormLoading = false;

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
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
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
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Form(
            key: _formKey, // helps us validate form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: themeProvider.isLightTheme
                            ? Constants.authLightThemePageTitle
                            : Constants.authDarkThemePageTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.05,
                      Text(
                        "Login to your account",
                        style: themeProvider.isLightTheme
                            ? Constants.authDescriptionLightThemeText
                            : Constants.authDescriptionDarkThemeText,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.1,
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
                            style: themeProvider.isLightTheme
                                ? TextStyle(color: Colors.black)
                                : TextStyle(color: Colors.white),
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
                      1.15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: themeProvider.isLightTheme
                                ? Constants.linkLightThemeText
                                : Constants.linkDarkThemeText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                            style: themeProvider.isLightTheme
                                ? TextStyle(color: Colors.black)
                                : TextStyle(color: Colors.white),
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
                    FadeAnimation(
                      1.2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Forgot your Password ?",
                              style: themeProvider.isLightTheme
                                  ? Constants.linkLightThemeText
                                  : Constants.linkDarkThemeText,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ForgetPasswordPage()));
                              },
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: themeProvider.themeMode().iconColor),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FadeAnimation(
                        1.3,
                        Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                // loading while checking validation
                                setState(() => loading = true);
                                // if all text form fields are valid then login user
                                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                if (result == null) {
                                  // login unsuccessful
                                  setState(() {
                                    loading = false;
                                    error = 'Can\'t login with these credentials.';
                                  });

                                  // display error in snack bar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Container(
                                            height: 20,
                                            child: Center(child: Text(error, style: TextStyle(color: Colors.white)))
                                        ),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                } else {
                                  // login successful
                                  setState(() {
                                    loading = false;
                                  });
                                  String msg = 'Login Successful';

                                  // display success in snack bar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Container(
                                            height: 20,
                                            child: Center(child: Text(msg, style: TextStyle(color: Colors.white)))
                                        ),
                                        backgroundColor: Colors.green,
                                      )
                                  );
                                }
                              }
                              /*Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => LoginPage()));*/
                            },
                            color: themeProvider.themeMode().gradient[0],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Login",
                              style: themeProvider.isLightTheme
                                  ? Constants.buttonLightThemeText
                                  : Constants.buttonDarkThemeText,
                            ),
                          ),
                        )),
                    FadeAnimation(
                        1.35,
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              dynamic result = await _auth.googleSignIn();
                              if (result == null) {
                                // login unsuccessful
                                setState(() {
                                  loading = false;
                                  error = 'Can\'t login with these credentials.';
                                });

                                // display error in snack bar
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                          height: 20,
                                          child: Center(child: Text(error, style: TextStyle(color: Colors.white)))
                                      ),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              } else {
                                // login successful
                                String msg = 'Login Successful';

                                // display success in snack bar
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                          height: 20,
                                          child: Center(child: Text(msg, style: TextStyle(color: Colors.white)))
                                      ),
                                      backgroundColor: Colors.green,
                                    )
                                );
                              }
                            },
                            color: themeProvider.themeData(context).dividerColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FaIcon(FontAwesomeIcons.google),
                                Text(
                                  "Login With Google",
                                  style: themeProvider.isLightTheme
                                      ? Constants.buttonLightThemeText
                                      : Constants.buttonDarkThemeText,
                                ),
                              ],
                            ),
                          ),
                        )),
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account ? Sign Up",
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