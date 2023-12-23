import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/features/common/themes/themes.dart';
import 'package:suitmedia_application_test/src/features/first_screen/first_screen.dart';

/// App Class
///
/// The root widget for the application, configuring the MaterialApp
/// instance. This class sets the overall theme using the [AppTheme] class and
/// specifies the initial screen to be displayed, that is the [FirstScreen].
class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const FirstScreen(),
    );
  }
}
