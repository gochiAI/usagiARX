import 'package:flutter/material.dart';

class ShowMaterialBanner extends StatefulWidget {
  const ShowMaterialBanner({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ShowMaterialBanner> {
  @override
  Widget build(BuildContext context) {
    // https://medium.com/flutter/whats-new-in-flutter-2-5-6f080c3f3dc
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Material Banner'),
        centerTitle: true,
      ),
      body: _container(
        children: [
          _sized(
            _button(
              'show Material Banner',
              _showMaterialBanner,
            ),
          ),
          _spacer(),
          _sized(
            _button(
              'show Snack Bar',
              _showSnackBar,
            ),
          ),
        ],
      ),
    );
  }

  Widget _container({List<Widget> children = const <Widget>[]}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget _sized(Widget w) {
    return SizedBox(
      child: w,
      width: 200,
    );
  }

  Widget _spacer() {
    return const SizedBox(
      height: 15,
    );
  }

  Widget _button(String text, Function() fn) {
    return ElevatedButton(
      child: Text(text),
      onPressed: fn,
    );
  }

  void _showMaterialBanner() {
    final messenger = ScaffoldMessenger.of(context);

    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Text('これが Material Banner です.'),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.amber,
        actions: [
          TextButton(
            child: const Text('消す'),
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
            },
          ),
        ],
      ),
    );
  }

  void _showSnackBar() {
    final messenger = ScaffoldMessenger.of(context);

    messenger.showSnackBar(
      const SnackBar(
        content: Text('これが Snack Bar です'),
      ),
    );
  }
}
