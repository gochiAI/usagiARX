import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/home/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
