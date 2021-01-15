import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey[200]),
                ),
                hintText: "Search",
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () {}
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
