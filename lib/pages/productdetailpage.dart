import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';
import '../constants.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String description;
  final String price;

  ProductDetailPage(
      {this.id, this.name, this.img, this.description, this.price});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeMode().backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.name,
            style: themeProvider.isLightTheme
                ? Constants.lightThemeHeading
                : Constants.darkThemeHeading),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: themeProvider.themeMode().iconColor,
        ),
        actions: <IconButton>[
          IconButton(
            onPressed: () {
              // save item
            },
            icon: Icon(Icons.bookmark_border),
            color: themeProvider.themeMode().iconColor,
          ),
          IconButton(
            onPressed: () {
              // open cart
            },
            icon: Icon(Icons.shopping_cart),
            color: themeProvider.themeMode().iconColor,
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Hero(
            tag: 'dash',
            child: Container(
              width: 400,
              height: 300,
              color: Colors.redAccent,
              //decoration: BoxDecoration(
              //image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.cover)
              //),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Description :",
                  style: themeProvider.isLightTheme
                      ? Constants.itemTitleLightThemeText
                      : Constants.itemTitleDarkThemeText,
                ),
                SizedBox(width: 15),
                Flexible(
                  flex: 2,
                  child: Text(
                    widget.description,
                    style: themeProvider.isLightTheme
                        ? Constants.itemDescriptionLightThemeText
                        : Constants.itemDescriptionDarkThemeText,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Price :",
                  style: themeProvider.isLightTheme
                      ? Constants.itemTitleLightThemeText
                      : Constants.itemTitleDarkThemeText,
                ),
                SizedBox(width: 20),
                Text(
                  widget.price,
                  style: themeProvider.isLightTheme
                      ? Constants.itemDescriptionLightThemeText
                      : Constants.itemDescriptionDarkThemeText,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 15),
          MaterialButton(
            minWidth: double.infinity,
            height: 60,
            onPressed: () {
              // add to cart function here
            },
            color: themeProvider.themeMode().toggleButtonColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text("ADD TO CART",
                style: themeProvider.isLightTheme
                    ? TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0)
                    : Constants.buttonDarkThemeText),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
