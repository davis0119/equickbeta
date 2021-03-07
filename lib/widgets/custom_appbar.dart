import 'package:flutter/material.dart';
import 'package:easy_quick/theme.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: themeProvider.themeMode().iconColor),
                ),
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: themeProvider.themeMode().iconColor),
                suffixIcon: IconButton(
                    icon: Icon(Icons.filter_list, color: themeProvider.themeMode().iconColor),
                    onPressed: () {}
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: themeProvider.themeMode().gradient[3]),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
