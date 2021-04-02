import 'package:easy_quick/Models/test_user.dart';
import 'package:easy_quick/pages/item_post_page.dart';
import 'package:easy_quick/services/database.dart';
import 'package:easy_quick/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:easy_quick/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemPostPage();
  }
}
