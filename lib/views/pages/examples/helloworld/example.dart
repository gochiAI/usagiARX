import 'package:flutter/material.dart';

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelloWorld'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'hello world',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
