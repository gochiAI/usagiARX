import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'basic_05_InheritedWidget_and_ValueNotifier',
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
        child: Body(),
      ),
    );
  }
}

class BodyData extends InheritedWidget {
  BodyData({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final text = ValueNotifier('hello world');

  void toggleText() {
    final curr = text.value;
    text.value = curr.startsWith('h') ? curr.toUpperCase() : curr.toLowerCase();
  }

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
    final data = BodyData.of(context, listen: true);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: data.text,
            builder: (context, String value, _) {
              return Text(
                value,
                style: Theme.of(context).textTheme.headline3,
              );
            },
          ),
          ElevatedButton(
            onPressed: data.toggleText,
            child: const Text('PUSH'),
          ),
        ],
      ),
    );
  }
}
