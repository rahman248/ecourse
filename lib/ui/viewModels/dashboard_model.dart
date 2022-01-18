
import 'package:ecourse/model/category.dart';
import 'package:ecourse/model/users.dart';
import 'package:ecourse/services/firestore.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/services/services.dart';
import 'package:ecourse/utils/constant.dart';

import '../../locator.dart';
import 'base_model.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authenticationService = locator<AuthService>();


  Users? _users;
  Users? get users => _users;
  List<Categories>? _categoryList;
  List<Categories>? get categoryList => _categoryList;

  Future<Users?> getUsersData() async {
    setBusy(true);
    var _userData = await _authenticationService.userData();

    var uId = _userData?.uid;
    _users = await _firestoreService.getUser(uId ?? '');
    if (_users == null){
      setBusy(false);
      return null;
    } else {
      setBusy(false);
      return _users;
    }
  }

  Future<List<Categories>?> getCourse() async{
    setBusy(true);
    _categoryList = await _firestoreService.getCategories();
    setBusy(false);
  }



  void moveToPopular() {
    _navigationService.navigateTo(PopularViewRoute);
  }








}