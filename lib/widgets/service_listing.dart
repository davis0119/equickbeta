import 'package:easy_quick/Models/service.dart';
import 'package:easy_quick/pages/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../theme.dart';

class ServiceListing extends StatefulWidget {

  final Service service;

  ServiceListing({this.service});

  @override
  _ServiceListingState createState() => _ServiceListingState();
}

class _ServiceListingState extends State<ServiceListing> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ProductDetailPage()
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
                    child: widget.service.photos[0], //
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
                        widget.service.title,
                        style: themeProvider.isLightTheme
                            ? Constants.itemTitleLightThemeText
                            : Constants.itemTitleDarkThemeText,
                      ),
                      Text(
                        widget.service.description,
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
                  '${widget.service.price}',
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
