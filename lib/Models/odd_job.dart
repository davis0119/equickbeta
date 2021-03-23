import 'package:easy_quick/Models/user.dart';
import 'package:flutter/material.dart';

class Favor {

  final String title;
  final String description;
  final int offer;
  final String id;
  final List<Image> photos;
  final bool isBoosted;
  final List<User> freelancers;
  final User requester;

  Favor({this.title, this.description, this.offer, this.id, this.photos, this.isBoosted, this.freelancers, this.requester});

}