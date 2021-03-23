import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/pages/productdetailpage.dart';
import 'package:easy_quick/widgets/custom_appbar.dart';
import 'package:easy_quick/widgets/order_tile.dart';
import 'package:easy_quick/widgets/previous_purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/JsonParse/posts.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';
import '../constants.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

Color PrimaryColor = Colors.white;

class _OrdersPageState extends State<OrdersPage> {
  List<Post> _posts;
  bool _loading;

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: themeProvider.themeData(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: themeProvider.themeMode().barColor,
            elevation: 0,
            title: CustomAppbar(),
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: themeProvider.themeMode().gradient[3],
              //if white use lightBlueAccent
              indicatorWeight: 2.5,
              onTap: (index) {
                setState(() {
                  switch (index) {
                    case 0:
                      PrimaryColor =
                          themeProvider.themeData(context).backgroundColor;
                      break;
                    case 1:
                      PrimaryColor =
                          themeProvider.themeData(context).backgroundColor;
                      break;
                    case 2:
                      PrimaryColor =
                          themeProvider.themeData(context).backgroundColor;
                      break;
                    case 3:
                      PrimaryColor =
                          themeProvider.themeData(context).backgroundColor;
                      break;
                    default:
                  }
                });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      "Purchases",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Orders",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: null == _posts ? 0 : _posts.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Post post = _posts[index];
                    return PreviousPurchase(
                      title: 'Previous Purchase',
                      description: post.title,
                      price: '\$ X.XX',
                      thumbnail: Image.network(post.thumbnailUrl),
                    );
                  },
                ),
              ),
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: null == _posts ? 0 : _posts.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Post post = _posts[index];
                    return OrderTile(
                      title: 'Previous Purchase',
                      description: post.title,
                      price: '\$ X.XX',
                      thumbnail: Image.network(post.thumbnailUrl),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
