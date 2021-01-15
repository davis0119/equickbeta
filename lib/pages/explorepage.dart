import 'package:easy_quick/constants.dart';
import 'package:easy_quick/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/JsonParse/posts.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

Color PrimaryColor = Colors.white;

class _ExplorePageState extends State<ExplorePage> {

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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          elevation: 0,
          title: CustomAppbar(),
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: Colors.lightBlueAccent, //if white use lightBlueAccent
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
                  case 2:
                    PrimaryColor = Colors.white;
                    break;
                  case 3:
                    PrimaryColor = Colors.white;
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
                    style: Constants.regularHeading,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    "Services",
                    style: Constants.regularHeading,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    "Auctions",
                    style: Constants.regularHeading,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    "Odd Jobs",
                    style: Constants.regularHeading,
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
                      title: Text("Random Item", style: Constants.regularDarkText),
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
                      title: Text("Random Service", style: Constants.regularDarkText),
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
                      title: Text("Random Auction", style: Constants.regularDarkText),
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
                      title: Text("Random Odd Job", style: Constants.regularDarkText),
                      subtitle: Text(post.title, style: Constants.descriptionText),
                      trailing: Text("X.XX", style: Constants.regularHeading),
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
