import 'package:flutter/material.dart';

/// フルスクリーンでローディングを表示するサンプルです.
///
/// ### REFERENCES
/// - https://qiita.com/bon_ninax/items/331eabfdd2cab9efca96
/// - https://api.flutter.dev/flutter/widgets/showGeneralDialog.html
class FullScreenLoading extends StatefulWidget {
  const FullScreenLoading({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<FullScreenLoading> {
  var _dialogClosed = false;
  var _dialogDismissible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Loading'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dismissible:'),
                Switch(
                  value: _dialogDismissible,
                  onChanged: (v) => setState(
                    () => _dialogDismissible = v,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                _showDialog();

                await Future<void>.delayed(
                  const Duration(milliseconds: 3000),
                );

                if (!_dialogClosed) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('SHOW'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    _dialogClosed = false;

    showGeneralDialog(
      context: context,
      barrierDismissible: _dialogDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ).then((_) => _dialogClosed = true);
  }
}
