
import 'package:ecourse/model/users.dart';
import 'package:ecourse/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  late final SharedPreferences _pref;




  User? _currentUser;
  User? get currentUser => _currentUser;


  Future<bool> isNewStartUser() async {
    _pref = await SharedPreferences.getInstance();
    final isFirst = _pref.getBool('isFirstInstall') ?? true;
    print("get value is:>> "+isFirst.toString());
    return isFirst;
  }

  Future setIsFirst(bool isFirstInstall) async {
    final isFirst = _pref.setBool('isFirstTime', isFirstInstall);
    print("get value is:>> "+isFirstInstall.toString());

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
    required String fullName
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = Users(
        id: authResult.user?.uid as String,
        email: email,
        fullName: fullName,
      ) as User?;

      await _firestoreService.createUser(_currentUser as Users);

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


  Future _populateCurrentUser(User? user) async {

    if (user != null){
      _currentUser = await _firestoreService.getUser(user.uid);
    } else{
      _currentUser = null;
    }

  }
}
