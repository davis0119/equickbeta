import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/JsonParse/posts.dart';
import 'package:easy_quick/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("xX_user_name_Xx", style: Constants.regularDarkText,),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            )
          ],
        ),
        key: scaffoldKey,
        body: GridView.builder(
          itemBuilder: (context, index) {
            Post post = _posts[index];
            return Image.network(post.thumbnailUrl);
          },
          itemCount: null == _posts ? 0 : _posts.length,
          physics: BouncingScrollPhysics(),
        ),
        endDrawer: SideDrawer(),
      ),
    );
  }
}
