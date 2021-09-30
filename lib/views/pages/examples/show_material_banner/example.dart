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
      body: Center(
        child: ElevatedButton(
          child: const Text('show'),
          onPressed: () {
            final messenger = ScaffoldMessenger.of(context);

            messenger.showMaterialBanner(
              MaterialBanner(
                content: const Text('hello'),
                leading: const Icon(Icons.info),
                backgroundColor: Colors.yellow,
                actions: [
                  TextButton(
                    child: const Text('dismiss'),
                    onPressed: () {
                      messenger.hideCurrentMaterialBanner();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
