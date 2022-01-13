import 'package:ecourse/services/auth.dart';
import 'package:ecourse/services/firestore.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/shared/dialog_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreService());
}