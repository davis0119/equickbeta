import 'package:easy_quick/Models/user.dart';
import 'package:flutter/material.dart';

class Item {

  final String title;
  final String description;
  final int price;
  final String id;
  final List<Image> photos;
  final bool isBoosted;
  final List<User> buyers;
  final User owner;
  final bool isAvailable;

  Item({this.title, this.description, this.price, this.id, this.photos, this.isBoosted, this.buyers, this.owner, this.isAvailable});

}