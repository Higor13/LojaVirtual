import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// Model containing Login's state (current user)
class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? firebaseUser;
  Map<String, dynamic>? userData =
      Map(); // Contains User's data (email, senha...)

  bool isLoading = false;

  //Functions that modify the state
  void signUp(
      {required Map<String, dynamic> userData,
      required String pass,
      required VoidCallback onSuccess,
      required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)
        .then((user) async {
      firebaseUser = user;

      // await _saveUserData(userData, user);
      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners(); // Everything inside the ScopedModelDescendant will be recreated
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;
    notifyListeners();
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return firebaseUser != null;
    // return userData != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.user?.uid)
        .set(userData);
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.user?.uid)
    //     .set(userData);
  }
}
