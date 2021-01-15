import 'package:easy_quick/pages/accountpage.dart';
import 'package:easy_quick/pages/explorepage.dart';
import 'package:easy_quick/pages/orderspage.dart';
import 'package:easy_quick/pages/postpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/pages/homepage.dart';

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
              builder = (BuildContext context) => HomePage();
              break;
            case '/explore_page':
              builder = (BuildContext context) => ExplorePage();
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
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      currentIndex: _currentIndex,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _navigatorKey.currentState.pushReplacementNamed('/');
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.explore),
            onPressed: () {
              _navigatorKey.currentState.pushReplacementNamed('/explore_page');
              setState(() {
                _currentIndex = 1;
              });
              },
          ),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              _navigatorKey.currentState.pushReplacementNamed('/post_page');
              setState(() {
                _currentIndex = 2;
              });
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
              _navigatorKey.currentState.pushReplacementNamed('/account_page');
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
}
