import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final String text;
  final Function onPressed;
  final bool outlineBtn;
  final bool isLoading;
  CustomBtn({this.text, this.onPressed, this.outlineBtn, this.isLoading}); // constructor

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false; // if outlineBtn is null then _outlineBtn is false
    bool _isLoading = isLoading ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isLoading ? false : true, // if it is loading the text in button is not visible
              child: Center(
                child: Text(
                  text ?? "Text", //if text is null then "Text" is displayed
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: _outlineBtn ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
