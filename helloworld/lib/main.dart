import 'package:flutter/material.dart';

void main() {
  // Flutter では、全てが ウィジェット という考え方。
  // (Dart では 全てが オブジェクト という考え方)
  //
  // Flutterでは、アプリケーションは runApp() でスタートする。
  // runApp() に渡すのも ウィジェット となる。
  //
  // アプリケーションは、基本的に以下の構造で作る
  //
  // MaterialApp
  //   └> Scaffhold
  //        └> 自分のウィジェット
  //
  // - MaterialApp で、タイトルやテーマなどのアプリケーション全体の設定を行う
  // - Scaffhold で、画面の足場の設定を行う
  // - その中に自分の画面、つまり、ウィジェットを作り込む
  //
  // というイメージ。
  //
  // なので、最小構成の HelloWorld は以下のようになる。
  runApp(MaterialApp(
    title: 'Flutter HelloWorld',
    theme: ThemeData.dark(),
    home: const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    ),
  ));
}
