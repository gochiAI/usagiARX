import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  late Future<String> _proc;

  @override
  void initState() {
    super.initState();

    _proc = Future.delayed(
      const Duration(seconds: 5),
      () => 'HELLO WORLD',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _proc,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }

            return Text(
              snapshot.data!,
              style: Theme.of(context).textTheme.headline3,
            );
          },
        ),
      ),
    );
  }
}
