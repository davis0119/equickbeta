import 'package:easy_quick/Models/user.dart';
import 'package:easy_quick/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance; // give us access to different methods

  // create user object based on auth.User
  User _userFromFirebaseUser(auth.User user) {
    return user != null && user.emailVerified ? User(uid: user.uid) : null;
  }

  // auth change user stream (tracking authentication changes for users)
  Stream<User> get user {
    return _auth.authStateChanges() // returning a stream on _auth object
      // then we map auth.User to Users when auth changes
      .map(_userFromFirebaseUser);
  }

  // get the email verification status
  bool getIsVerified(auth.User user) {
    return user.emailVerified;
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password); // request auth result from Firebase
      auth.User user = result.user;

      return _userFromFirebaseUser(user); // We return custom user object
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.User user = result.user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }

      // create a new document for the user with the uid in database
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Reset password
  Future resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // sign in with google

  // register with google


  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      // Place error snack bar here
      return null;
    }
  }

  // delete account

}