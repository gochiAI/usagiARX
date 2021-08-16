import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'basic_04_inheritedwidget',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyData(
        text: 'hello world',
        textStyle: Theme.of(context).textTheme.headline3!,
        child: Body(),
      ),
    );
  }
}

/// See: https://devlights.hatenablog.com/entry/2021/08/15/221759
class BodyData extends InheritedWidget {
  final String text;
  final TextStyle textStyle;

  const BodyData({
    Key? key,
    required this.text,
    required this.textStyle,
    required Widget child,
  }) : super(key: key, child: child);

  static BodyData of(BuildContext context, {required bool listen}) {
    final f1 = context.dependOnInheritedWidgetOfExactType;
    final f2 = context.getElementForInheritedWidgetOfExactType;

    return listen ? f1<BodyData>()! : f2<BodyData>()!.widget as BodyData;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BodyData.of(context, listen: false);

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.text,
            style: data.textStyle,
          ),
        ],
      ),
    );
  }
}
