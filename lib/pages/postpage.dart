import 'package:easy_quick/animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FadeAnimation(1.0, MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {

              },
              color: Colors.deepOrangeAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Add Item", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            )),
            FadeAnimation(1.1, MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {

              },
              color: Colors.blueAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Add Service", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            )),
            FadeAnimation(1.2, MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {

              },
              color: Colors.lightGreenAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Add Auction", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            )),
            FadeAnimation(1.3, MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {

              },
              color: Colors.deepPurpleAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Add Odd Job", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            )),
            FadeAnimation(1.35, MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {

              },
              color: Colors.yellow,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Add Collection", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            )),
          ],
        ),
      ),
    );
  }
}
