import 'package:easecar/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

Future<void> buildApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String flavorEnvironment =
      String.fromEnvironment('FLAVOR', defaultValue: 'development');

  FirebaseOptions firebaseOptions;

  switch (flavorEnvironment) {
    case 'development':
      firebaseOptions = DefaultFirebaseOptions.currentPlatform;
      break;
    case 'production':
      firebaseOptions = DefaultFirebaseOptions.currentPlatform;
      break;
    default:
      firebaseOptions = DefaultFirebaseOptions.currentPlatform;
  }

  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  FirebaseCrashlytics.instance.setCustomKey('environment', flavorEnvironment);

  FlutterError.onError = (errorDetails) {
    if (kDebugMode) return;
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) return false;
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
