import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/examples/helloworld/helloworld_page.dart';
import 'package:tryflutter/views/pages/examples/inheritedwidget/inherited_widget_page.dart';
import 'package:tryflutter/views/pages/examples/statefulwidget/clock_page.dart';
import 'package:tryflutter/views/pages/examples/statelesswidget/stateless_widget_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: [
        _btn(context, (_) => const HelloWorldPage(), 'Hello World'),
        _btn(context, (_) => const StatelessWidgetPage(), 'Stateless Widget'),
        _btn(context, (_) => const ClockPage(), 'Stateful Widget'),
        _btn(context, (_) => const InheritedWidgetPage(), 'Inherited Widget'),
      ],
    );
  }

  Widget _btn(
    BuildContext context,
    Widget Function(BuildContext) fn,
    String caption,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: fn,
          ),
        );
      },
      child: Text(caption),
    );
  }
}
