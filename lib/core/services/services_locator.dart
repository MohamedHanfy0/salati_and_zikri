import 'package:get_it/get_it.dart';
import 'package:islami/core/services/services_shared_preferences.dart';

final getIt = GetIt.instance;

void servicesLocator() {
  getIt.registerSingleton<ServicesSharedPreferences>(ServicesSharedPreferences());

}