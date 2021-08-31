import 'package:flutter/material.dart';

/// [StatelessWidgetPage] は、[StatelessWidget]のサンプルです.
///
/// [build] メソッドで自身を構築して返します.
///
/// 状態を持つ必要があるウィジェットを作る場合は [StatefulWidget] から継承します.
///
/// ### References
///   - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatelessWidget',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
