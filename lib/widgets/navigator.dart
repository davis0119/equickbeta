import 'package:easy_quick/pages/accountpage.dart';
import 'package:easy_quick/pages/explorepage.dart';
import 'package:easy_quick/pages/item_post_page.dart';
import 'package:easy_quick/pages/orderspage.dart';
import 'package:easy_quick/pages/postpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';

import '../constants.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;

// ...

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_navigatorKey.currentState.canPop()) {
            _navigatorKey.currentState.pop();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: _navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            // Manage your route names here
            switch (settings.name) {
              case '/':
                builder = (BuildContext context) => ExplorePage();
                break;
              case '/home_page':
                builder = (BuildContext context) => HomePage();
                break;
              case '/post_page':
                builder = (BuildContext context) => PostPage();
                break;
              case '/orders_page':
                builder = (BuildContext context) => OrdersPage();
                break;
              case '/account_page':
                builder = (BuildContext context) => AccountPage();
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
            // You can also return a PageRouteBuilder and
            // define custom transitions between pages
            return CupertinoPageRoute(
              builder: builder,
              settings: settings,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: themeProvider.themeMode().barColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        unselectedItemColor: themeProvider.themeMode().iconColor,
        selectedItemColor: themeProvider.themeMode().gradient[3],
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.explore),
              onPressed: () {
                _navigatorKey.currentState.pushReplacementNamed('/');
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(CupertinoIcons.chat_bubble_fill),
              onPressed: () {
                _navigatorKey.currentState.pushReplacementNamed('/home_page');
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            title: Text('Chats'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                _bottomSheet();
                /*_navigatorKey.currentState.pushReplacementNamed('/post_page');
                setState(() {
                  _currentIndex = 2;
                });*/
              },
            ),
            title: Text('Post'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.monetization_on),
              onPressed: () {
                _navigatorKey.currentState.pushReplacementNamed('/orders_page');
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                _navigatorKey.currentState
                    .pushReplacementNamed('/account_page');
                setState(() {
                  _currentIndex = 4;
                });
              },
            ),
            title: Text('Accounts'),
          ),
        ],
      ),
    );
  }

  void _bottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
          ),
        ),
        child: Column(

          children: <Widget>[
            SizedBox(height: 15.0),
            Text('Post to EasyQuick', style: themeProvider.isLightTheme
                ? Constants.bottomSheetTitleLightThemeText
                : Constants.bottomSheetTitleDarkThemeText
            ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => ItemPostPage())
                        );
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.icecream, size: 25.0, color: themeProvider.themeMode().gradient[6]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                            width: 2.0,
                            style: BorderStyle.solid,
                            color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                        'Item',
                        style: themeProvider.isLightTheme
                            ? Constants.bottomSheetDescriptionLightThemeHeading
                            : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pop(context);
                        // TODO: Navigate to Post page
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.home_repair_service, size: 25.0, color: themeProvider.themeMode().gradient[7]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Service',
                      style: themeProvider.isLightTheme
                          ? Constants.bottomSheetDescriptionLightThemeHeading
                          : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pop(context);
                        // TODO: Navigate to Post page
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.timer, size: 25.0, color: themeProvider.themeMode().gradient[8]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Auction',
                      style: themeProvider.isLightTheme
                          ? Constants.bottomSheetDescriptionLightThemeHeading
                          : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pop(context);
                        // TODO: Navigate to Post page
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.loyalty, size: 25.0, color: themeProvider.themeMode().gradient[9]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Favor',
                      style: themeProvider.isLightTheme
                          ? Constants.bottomSheetDescriptionLightThemeHeading
                          : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
