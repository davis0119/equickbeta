import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_quick/Models/test_user.dart';
import 'package:easy_quick/Models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference itemCollection = FirebaseFirestore.instance.collection('Items');

  // creates/updates documents for user collection
  Future updateUserData(String name, String school, int year) async {
    // creates document with uid if document doesn't exist also updates document
    return await userCollection.doc(uid).set({
      // key : value pairs
      'name': name,
      'school': school,
      'year': year,
    });
  }

  /*Future updateItemData(String title;
  String description;
  int price;
  String id;
  List<Image> photos;
  bool isBoosted;
  List<User> buyers;) async {
    // creates document with uid if document doesn't exist also updates document
    return await userCollection.doc(uid).set({
      // key : value pairs
      'name': name,
      'school': school,
      'year': year,
    });
  }*/

  // User list from snapshot
  List<TestUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return TestUser(
        name: doc.data()['name'] ?? '', // doc.data is a map and we pass in the key 'name' if it doesn't exist return empty string
        year: doc.data()['year'] ?? 0,
        school: doc.data()['school'] ?? 'Penn',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugar'],
      strength: snapshot.data()['strength'],
    );
  }

  // gets user stream
  Stream<List<TestUser>> get users {
    return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}