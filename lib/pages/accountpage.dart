import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/JsonParse/posts.dart';
import 'package:easy_quick/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';
import 'dart:math';
import '../constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Post> _posts;
  bool _loading;
  var rng = new Random();

  @override
  void initState() {
    super.initState();
    _loading = true;
    JsonServices.getPosts().then((posts) {
      setState(() {
        _posts = posts;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("xX_user_name_Xx",
              style: themeProvider.isLightTheme
                  ? Constants.lightThemeHeading
                  : Constants.darkThemeHeading),
          centerTitle: true,
          backgroundColor: themeProvider.themeData(context).backgroundColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              color: themeProvider.themeMode().iconColor,
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        backgroundColor: themeProvider.themeData(context).backgroundColor,
        key: scaffoldKey,
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'User 1 Online Store!',
                        style: themeProvider.isLightTheme
                            ? Constants.lightThemeHeading
                            : Constants.darkThemeHeading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.star_border),
                          color: themeProvider.themeMode().iconColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          color: themeProvider.themeMode().iconColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          color: themeProvider.themeMode().iconColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          color: themeProvider.themeMode().iconColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.star_border),
                          color: themeProvider.themeMode().iconColor,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                        'sed do eiusmod tempor incididunt ut labore et dolore '
                        'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                        'exercitation ullamco laboris nisi ut aliquip ex ea '
                        'commodo consequat. Duis aute irure dolor in reprehenderit. ',
                        style: themeProvider.isLightTheme
                            ? Constants.accountDescriptionLightThemeText
                            : Constants.accountDescriptionDarkThemeText,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: themeProvider.themeMode().backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) {
                  Post post = _posts[index];
                  return Container(
                      color: themeProvider.themeMode().gradient[
                          rng.nextInt(11)]); //Image.network(post.thumbnailUrl);
                },
                itemCount: 18,
                //null == _posts ? 0 : _posts.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // how many squares in row
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                primary: true,
              ),
            ),
          ],
        ),
        endDrawer: SideDrawer(),
      ),
    );
  }
}
