import 'dart:async';

import 'package:flutter/material.dart';

/// [StreamBuilder]についてのサンプルです.
class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StreamBuilderPage> {
  late Stream<int> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream.periodic(const Duration(seconds: 1), (v) => v).take(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return _t('${snapshot.data}');
              case ConnectionState.done:
                return _t('DONE');
              default:
                return _t('UNKNOWN');
            }
          },
        ),
      ),
    );
  }

  Widget _t(String message) {
    return Text(
      message,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
