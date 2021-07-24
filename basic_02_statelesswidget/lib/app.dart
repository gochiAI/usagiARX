import 'package:flutter/material.dart';

/// [App] は、本アプリのトップウィジェットです.
///
/// [build] では、[MaterialApp]を生成し返しているだけなので
/// 状態を持つ必要がありません。なので、[StatelessWidget]を利用しています。
///
/// 状態を持つ必要があるウィジェットを作る場合は [StatelessWidget] から継承します.
///
/// ### References
///   - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic-02 StatelessWidget',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Text('Basic-02 StatelessWidget'),
        ),
      ),
    );
  }
}
