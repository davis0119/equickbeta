import 'package:easy_quick/Models/user.dart';
import 'package:flutter/material.dart';

class Auction {

  final String title;
  final String description;
  final int updatedPrice;
  final String id;
  final List<Image> photos;
  final bool isBoosted;
  final List<User> bidders;
  final int endTime;
  final User owner;

  Auction({this.bidders, this.endTime, this.title, this.description, this.updatedPrice, this.id, this.photos, this.isBoosted, this.owner});

}