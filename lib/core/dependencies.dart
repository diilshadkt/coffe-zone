import 'package:coffee_zone/features/auth/services/firebase_auth_services.dart';
import 'package:get_it/get_it.dart';

final class DependencyInjection {
  static void registerDependencies() {
    final getIt = GetIt.I;

    getIt.registerSingleton(FirebaseAuthServices());
  }
}
