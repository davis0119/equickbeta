import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomInput extends StatelessWidget {

  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool obscureText;
  CustomInput({this.hintText, this.onChanged, this.onSubmitted, this.focusNode, this.textInputAction, this.obscureText});

  @override
  Widget build(BuildContext context) {

    bool _obscureText = obscureText ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Hint Text", // if hintText is null then "Hint Text"
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 18.0,
          )
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
