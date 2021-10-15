import 'package:flutter/material.dart';

/// 遷移先の画面から結果値を取得するサンプルです. ([WillPopScope])
///
/// ### REFERENCES
/// - https://tech-rise.net/return-data-on-click-back-button/
/// - https://qiita.com/canisterism/items/994f954df216d6b5a93b
class ReturnValueFromScreen extends StatefulWidget {
  const ReturnValueFromScreen({Key? key}) : super(key: key);

  @override
  _ReturnValueFromScreenState createState() => _ReturnValueFromScreenState();
}

class _ReturnValueFromScreenState extends State<ReturnValueFromScreen> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return value from Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final r = await Navigator.of(context).push(
                  MaterialPageRoute<String>(
                    builder: (context) => const _NextScreen(),
                  ),
                );

                if (r != null) {
                  setState(() => _result = r);
                }
              },
              child: const Text('次画面'),
            ),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends StatelessWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // AppBarの左上に表示される戻るアイコンをクリックした際の戻り値を
    // 制御したい場合は、 Scaffold を WillPopState ウィジェットで囲み
    // onWillPop で手動制御する必要がある.
    //
    // REFERENCES
    //   - https://tech-rise.net/return-data-on-click-back-button/
    //   - https://qiita.com/canisterism/items/994f954df216d6b5a93b
    //
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop('AppBarの戻るアイコンからの遷移');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Next screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('戻るボタンからの遷移');
                },
                child: const Text('前画面'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
