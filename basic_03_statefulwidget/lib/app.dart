import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic-03 StatefulWidget',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
