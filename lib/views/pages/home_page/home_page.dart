import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/home_page/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('try-flutter'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
