import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget + ValueNotifier'),
        centerTitle: true,
      ),
      body: BodyData(
        child: const Body(),
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
          ValueListenableBuilder<String>(
            valueListenable: data.text,
            builder: (context, value, _) {
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
