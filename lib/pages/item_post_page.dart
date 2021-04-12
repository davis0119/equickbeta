import 'package:easy_quick/widgets/image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import '../theme.dart';

class ItemPostPage extends StatefulWidget {
  @override
  _ItemPostPageState createState() => _ItemPostPageState();
}

class _ItemPostPageState extends State<ItemPostPage> {

  String description = '';
  String title = '';
  String price = '';

  bool loading;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                  children: [
                    Positioned(
                      top: 4,
                      left: 4,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: themeProvider.themeMode().iconColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    ImageCarousel(),
                  ]
              ),
              Divider(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Text(
                    'Title',
                    style: themeProvider.isLightTheme
                        ? Constants.linkLightThemeText
                        : Constants.linkDarkThemeText,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Name your item.' : null,
                    style: themeProvider.isLightTheme
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                    obscureText: false,
                    onChanged: (val) {
                      setState(() => title = val);
                    },
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 75,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Name your product...',
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeMode().gradient[6],
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
                    height: 15,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: themeProvider.isLightTheme
                        ? Constants.linkLightThemeText
                        : Constants.linkDarkThemeText,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Describe your item.' : null,
                    style: themeProvider.isLightTheme
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                    obscureText: false,
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 300,
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Describe your post...',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeMode().gradient[6],
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
                    height: 15,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Set Price',
                    style: themeProvider.isLightTheme
                        ? Constants.linkLightThemeText
                        : Constants.linkDarkThemeText,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Set a valid price.' : null,
                    style: themeProvider.isLightTheme
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                    obscureText: false,
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                    maxLength: 4,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      suffixText: '(min.\$1/max.\$2000)',
                      prefixText: '\$',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '(min.\$1/max.\$2000)',

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeMode().gradient[6],
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
                    height: 15,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    // boost function here
                  },
                  color: themeProvider.themeMode().gradient[10],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Boost Item ",
                        style: themeProvider.isLightTheme
                            ? Constants.buttonLightThemeText
                            : Constants.buttonDarkThemeText,
                      ),
                      Icon(
                        Icons.flash_on,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // loading while checking validation
                      // TODO: display indeterminate loading indicator while verifiying
                      setState(() => loading = true);
                      // if all text form fields are valid then create item

                    }
                  },
                  color: themeProvider.themeMode().gradient[6],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Post Item",
                    style: themeProvider.isLightTheme
                        ? Constants.buttonLightThemeText
                        : Constants.buttonDarkThemeText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
