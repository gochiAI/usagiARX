import 'package:flutter/material.dart';
import 'package:tryflutter/views/pages/examples/button_disabled/example.dart';
import 'package:tryflutter/views/pages/examples/buttons/example.dart';
import 'package:tryflutter/views/pages/examples/center_and_column_vertical_space/example.dart';
import 'package:tryflutter/views/pages/examples/center_and_row_horizontal_space/example.dart';
import 'package:tryflutter/views/pages/examples/full_screen_loading/example.dart';
import 'package:tryflutter/views/pages/examples/future_builder/example.dart';
import 'package:tryflutter/views/pages/examples/helloworld/example.dart';
import 'package:tryflutter/views/pages/examples/inheritedwidget/example.dart';
import 'package:tryflutter/views/pages/examples/return_value_from_screen/example.dart';
import 'package:tryflutter/views/pages/examples/show_material_banner/example.dart';
import 'package:tryflutter/views/pages/examples/statefulwidget/example.dart';
import 'package:tryflutter/views/pages/examples/statelesswidget/example.dart';
import 'package:tryflutter/views/pages/examples/stream_builder/example.dart';

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
        _btn(context, (_) {
          return const HelloWorldPage();
        }, 'Hello World'),
        _btn(context, (_) {
          return const StatelessWidgetPage();
        }, 'Stateless Widget'),
        _btn(context, (_) {
          return const ClockPage();
        }, 'Stateful Widget'),
        _btn(context, (_) {
          return const InheritedWidgetPage();
        }, 'Inherited Widget'),
        _btn(context, (_) {
          return const ButtonDisabledPage();
        }, 'Button Disabled'),
        _btn(context, (_) {
          return const FutureBuilderPage();
        }, 'Future Builder'),
        _btn(context, (_) {
          return const StreamBuilderPage();
        }, 'Stream Builder'),
        _btn(context, (_) {
          return const ReturnValueFromScreen();
        }, 'Return value from Screen'),
        _btn(context, (_) {
          return const CenterAndColumnVerticalSpace();
        }, 'Center and Column'),
        _btn(context, (_) {
          return const CenterAndRowHorizontalSpace();
        }, 'Center and Row'),
        _btn(context, (_) {
          return const ShowMaterialBanner();
        }, 'Show Material Banner'),
        _btn(context, (_) {
          return const Buttons();
        }, 'Buttons'),
        _btn(context, (_) {
          return const FullScreenLoading();
        }, 'Full Screen Loading'),
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
