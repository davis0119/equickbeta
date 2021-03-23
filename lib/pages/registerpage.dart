import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:easy_quick/pages/loginpage.dart';
import 'package:easy_quick/services/auth.dart';
import 'package:easy_quick/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String confirmPassword = '';

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
                        "Sign Up",
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
                        "Create your account.",
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
                            style: themeProvider.isLightTheme
                                ? TextStyle(color: Colors.black)
                                : TextStyle(color: Colors.white),
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
                            obscureText: true,
                            style: themeProvider.isLightTheme
                                ? TextStyle(color: Colors.black)
                                : TextStyle(color: Colors.white),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Confirm Password',
                            style: themeProvider.isLightTheme
                                ? Constants.linkLightThemeText
                                : Constants.linkDarkThemeText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (val) => val != password ? 'Passwords don\'t match' : null,
                            style: themeProvider.isLightTheme
                                ? TextStyle(color: Colors.black)
                                : TextStyle(color: Colors.white),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => confirmPassword = val);
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
                                // if all text form fields are valid then register user
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                if (result == null) {
                                  // registered unsuccessfully or emailed has not been verified
                                  setState(() {
                                    error = 'Check your email to verify this account.';
                                    loading = false;
                                  });

                                  // display error in snack bar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                        child: Center(child: Text(error, style: TextStyle(color: Colors.white))),
                                        height: 20.0,
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(milliseconds: 3000),


                                    )
                                  );
                                } else {
                                  // registered successfully

                                }
                              }
                              /*Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => LoginPage()));*/
                            },
                            color: themeProvider.themeMode().gradient[1],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Create Account",
                              style: themeProvider.isLightTheme
                                  ? Constants.buttonLightThemeText
                                  : Constants.buttonDarkThemeText,
                            ),
                          ),
                        )),
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Verified your account ?  Login",
                              style: themeProvider.isLightTheme
                                  ? Constants.linkLightThemeText
                                  : Constants.linkDarkThemeText,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginPage()));
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