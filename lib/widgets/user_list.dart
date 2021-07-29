import 'package:easy_quick/Models/test_user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final Iterable users = Provider.of<List<TestUser>>(context) as Iterable;

    users.forEach((user) {
      print(user.name);
      print(user.school);
      print(user.year);
    });

    return Container();
  }
}
