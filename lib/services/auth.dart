import 'package:ecourse/model/users.dart';
import 'package:ecourse/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  late final SharedPreferences _pref;




  Users? _currentUser;
  Users? get currentUser => _currentUser;


  Future<bool> isNewStartUser() async {
    _pref = await SharedPreferences.getInstance();
    final isFirst = _pref.getBool('isFirstInstall') ?? true;
    if (kDebugMode) {
      print("get value is:>> "+isFirst.toString());
    }
    return isFirst;
  }

  Future setIsFirst(bool isFirstInstall) async {
    final isFirst = _pref.setBool('isFirstTime', isFirstInstall);
    return isFirst;
  }


  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user as User);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
    required String username
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      // create a new user profile on firestore
      var userDb = Users(
        id: authResult.user?.uid as String,
        email: authResult.user?.email,
        fullName: fullName,
        username : username,
        password : password
      );

      await _firestoreService.createUser(userDb);

      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }



  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future<User?> userData() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user;
  }


  Future _populateCurrentUser(User? users) async {

    if (users != null){
      _currentUser?.id = await _firestoreService.getUser(users.uid);
    } else{
      _currentUser?.id = null;
    }

  }
}
