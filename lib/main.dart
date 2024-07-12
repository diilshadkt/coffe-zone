import 'package:coffee_zone/core/dependencies.dart';
import 'package:coffee_zone/core/router.dart';
import 'package:coffee_zone/features/auth/view/pages/landing_page.dart';
import 'package:coffee_zone/features/nav/pages/navigation_page.dart';
import 'package:coffee_zone/firebase_options.dart';
import 'package:coffee_zone/l10n/gen/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies();

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends HookWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FirebaseAuth.instance.authStateChanges().listen((user) {
          if (user != null && user.emailVerified) {
            App.navigatorKey.currentContext!.go(NavigationPage.routePath);
          } else {
            App.navigatorKey.currentContext!.go(LandingPage.routePath);
          }
        });
      });

      return null;
    }, []);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
    );
  }
}
