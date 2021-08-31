import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  late StreamController<int> _controller;

  @override
  void initState() {
    super.initState();

    _controller = StreamController<int>();
    Future(() async {
      for (var v in Iterable<int>.generate(10)) {
        _controller.sink.add(v);

        await Future<void>.delayed(
          const Duration(seconds: 1),
        );
      }

      _controller.close();
    });
  }

  @override
  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }

    super.dispose();
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
          stream: _controller.stream,
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
