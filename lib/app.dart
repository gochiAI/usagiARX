import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tryflutter/views/pages/home/home.dart';

/// アプリケーションを表します.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // スマホ端末で表示した際に日本語が中華フォントで
    // 表示されてしまう件は、以下のようにロケールを指定することで解決できる.
    //
    // REFERENCES:
    //   - https://qiita.com/najeira/items/dbf5663d1ed845fb1f51
    //
    const locale = Locale("ja", "JP");

    return GetMaterialApp(
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
      ),
      title: 'try-flutter',
      home: const Home(),
    );
  }
}
