import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/JsonParse/posts.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CustomAppbar(),
          ),
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: Colors.lightBlueAccent,
            indicatorWeight: 3.0,

            onTap: (index) {
              setState(() {
                switch (index) {
                  case 0:
                    PrimaryColor = Colors.white;
                    break;
                  case 1:
                    PrimaryColor = Colors.white;
                    break;
                }
              });
            },
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Text(
                    "Purchases",
                    style: Constants.regularHeading,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    "Orders",
                    style: Constants.regularHeading,
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
            itemCount: null == _posts ? 0 : _posts.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Post post = _posts[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                elevation: 1,
                shadowColor: Colors.black,
                child: ListTile(
                  leading: Image.network(post.thumbnailUrl),
                  title: Text("Previous Purchase", style: Constants.regularDarkText),
                  subtitle: Text(post.title, style: Constants.descriptionText),
                  trailing: Text("X.XX", style: Constants.regularHeading),
                ),
              );
              },
          ),
        ),
            Container(
              child: ListView.builder(
                itemCount: null == _posts ? 0 : _posts.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Post post = _posts[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                    elevation: 1,
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Image.network(post.thumbnailUrl),
                      title: Text("Order", style: Constants.regularDarkText),
                      subtitle: Text(post.title, style: Constants.descriptionText),
                      trailing: Text("User", style: Constants.regularHeading),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
