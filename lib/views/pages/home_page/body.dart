import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/examples/helloworld/helloworld_page.dart';
import 'package:tryflutter/views/pages/examples/statelesswidget/stateless_widget_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: [
        _helloworld(context),
        _statelessWidget(context),
      ],
    );
  }

  Widget _helloworld(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (context) => const HelloWorldPage(),
          ),
        );
      },
      child: const Text('HELLO WORLD'),
    );
  }

  Widget _statelessWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (context) => const StatelessWidgetPage(),
          ),
        );
      },
      child: const Text('Stateless Widget'),
    );
  }
}
