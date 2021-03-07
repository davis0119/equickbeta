import 'package:easy_quick/JsonParse/json_services.dart';
import 'package:easy_quick/JsonParse/posts.dart';
import 'package:easy_quick/pages/chatpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages",
            style: themeProvider.isLightTheme
                ? Constants.lightThemeHeading
                : Constants.darkThemeHeading),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeProvider.themeData(context).backgroundColor,
      ),
      body: ListView.builder(
        itemCount: null == _posts ? 0 : _posts.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Post post = _posts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => ChatScreen()),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.5,
                        color: themeProvider.themeMode().gradient[3],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: themeProvider.themeMode().shadow,
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(post.thumbnailUrl),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('username',
                                style: themeProvider.isLightTheme
                                    ? Constants.itemTitleLightThemeText
                                    : Constants.itemTitleDarkThemeText),
                            Text('time',
                                style: themeProvider.isLightTheme
                                    ? Constants.itemDescriptionLightThemeText
                                    : Constants.itemDescriptionDarkThemeText),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            post.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: themeProvider.isLightTheme
                                ? Constants.itemDescriptionLightThemeText
                                : Constants.itemDescriptionDarkThemeText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
