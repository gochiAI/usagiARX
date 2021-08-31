import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'try-flutter',
      home: HomePage(),
    );
  }
}
