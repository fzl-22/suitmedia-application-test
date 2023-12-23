import 'package:flutter/material.dart';
import 'package:suitmedia_application_test/src/features/common/themes/themes.dart';
import 'package:suitmedia_application_test/src/features/first_screen/first_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().theme,
      home: const FirstScreen(),
    );
  }
}
