import 'dart:math';

import 'package:easy_quick/constants.dart';
import 'package:easy_quick/pages/productdetailpage.dart';
import 'package:easy_quick/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/JsonParse/posts.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_quick/theme.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

Color PrimaryColor = Colors.white;

class _ExplorePageState extends State<ExplorePage> {

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 4,
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
                      PrimaryColor = themeProvider.themeData(context).backgroundColor;
                      break;
                    case 1:
                      PrimaryColor = themeProvider.themeData(context).backgroundColor;
                      break;
                    case 2:
                      PrimaryColor = themeProvider.themeData(context).backgroundColor;
                      break;
                    case 3:
                      PrimaryColor = themeProvider.themeData(context).backgroundColor;
                      break;
                    default:
                  }
                });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      "Items",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Services",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Auctions",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Odd Jobs",
                      style: themeProvider.isLightTheme ? Constants.tabLightThemeHeading : Constants.tabDarkThemeHeading,
                    ),
                  ),
                )
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
                    return GestureDetector(
                      onTap: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  id: post.id,
                                  description: post.title,
                                  name: 'Random Item',
                                  price: 'X.XX',
                                  img: post.thumbnailUrl,
                                )
                            ),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.only(
                                left: 15, top: 7, bottom: 7, right: 22),
                            decoration: BoxDecoration(
                              color: themeProvider.themeMode().backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: themeProvider.themeMode().shadow,
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Hero(
                                    tag: 'dash',
                                    child: Container(
                                      color: themeProvider.themeMode().gradient[rng.nextInt(11)],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('Random Item',
                                          style: themeProvider.isLightTheme ? Constants.itemTitleLightThemeText : Constants.itemTitleDarkThemeText,
                                      ),
                                      Text(post.title, style: themeProvider.isLightTheme ? Constants.itemDescriptionLightThemeText : Constants.itemDescriptionDarkThemeText,
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'X.XX',
                                  style: themeProvider.isLightTheme ? Constants.itemTitleLightThemeText : Constants.itemTitleDarkThemeText,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
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
                    return GestureDetector(
                      onTap: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  id: post.id,
                                  description: post.title,
                                  name: 'Random Service',
                                  price: 'X.XX',
                                  img: post.thumbnailUrl,
                                )
                            ),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.only(
                                left: 15, top: 7, bottom: 7, right: 22),
                            decoration: BoxDecoration(
                              color: themeProvider.themeMode().backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: themeProvider.themeMode().shadow,
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Hero(
                                    tag: 'dash',
                                    child: Container(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('Random Service',
                                        style: Constants.itemTitleLightThemeText,
                                      ),
                                      Text(post.title, style: Constants.itemDescriptionLightThemeText,
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'X.XX',
                                  style: Constants.itemTitleLightThemeText,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
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
                    return GestureDetector(
                      onTap: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  id: post.id,
                                  description: post.title,
                                  name: 'Random Auction',
                                  price: 'X.XX',
                                  img: post.thumbnailUrl,
                                )
                            ),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.only(
                                left: 15, top: 7, bottom: 7, right: 22),
                            decoration: BoxDecoration(
                              color: themeProvider.themeMode().backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: themeProvider.themeMode().shadow,
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Hero(
                                    tag: 'dash',
                                    child: Container(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('Random Auction',
                                        style: Constants.itemTitleLightThemeText,
                                      ),
                                      Text(post.title, style: Constants.itemDescriptionLightThemeText,
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'X.XX',
                                  style: Constants.itemTitleLightThemeText,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
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
                    return GestureDetector(
                      onTap: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  id: post.id,
                                  description: post.title,
                                  name: 'Random Odd Job',
                                  price: 'X.XX',
                                  img: post.thumbnailUrl,
                                )
                            ),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.only(
                                left: 15, top: 7, bottom: 7, right: 22),
                            decoration: BoxDecoration(
                              color: themeProvider.themeMode().backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: themeProvider.themeMode().shadow,
                            ),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Hero(
                                    tag: 'dash',
                                    child: Container(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('Random Odd Job',
                                        style: Constants.itemTitleLightThemeText,
                                      ),
                                      Text(post.title, style: Constants.itemDescriptionLightThemeText,
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'X.XX',
                                  style: Constants.itemTitleLightThemeText,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
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
