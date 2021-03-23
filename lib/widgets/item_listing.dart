import 'package:easy_quick/Models/item.dart';
import 'package:easy_quick/pages/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../theme.dart';

class ItemListing extends StatefulWidget {

  final Item item;

  ItemListing({this.item});

  @override
  _ItemListingState createState() => _ItemListingState();
}

class _ItemListingState extends State<ItemListing> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              //post.thumbnailUrl,
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
                  fit: FlexFit.tight,
                  child: Hero(
                    tag: 'dash',
                    child: widget.item.photos[0], //
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.item.title,
                        style: themeProvider.isLightTheme
                            ? Constants.itemTitleLightThemeText
                            : Constants.itemTitleDarkThemeText,
                      ),
                      Text(
                        widget.item.description,
                        style: themeProvider.isLightTheme
                            ? Constants
                            .itemDescriptionLightThemeText
                            : Constants
                            .itemDescriptionDarkThemeText,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${widget.item.price}',
                  style: themeProvider.isLightTheme
                      ? Constants.itemTitleLightThemeText
                      : Constants.itemTitleDarkThemeText,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
