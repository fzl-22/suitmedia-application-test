import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suitmedia_application_test/src/app.dart';

/// Main Function
///
/// The entry point of the application.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const App(),
  );
}
