import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryflutter/views/pages/examples/button_disabled/example.dart';
import 'package:tryflutter/views/pages/examples/buttons/example.dart';
import 'package:tryflutter/views/pages/examples/center_and_column_vertical_space/example.dart';
import 'package:tryflutter/views/pages/examples/center_and_row_horizontal_space/example.dart';
import 'package:tryflutter/views/pages/examples/full_screen_loading/example.dart';
import 'package:tryflutter/views/pages/examples/future_builder/example.dart';
import 'package:tryflutter/views/pages/examples/helloworld/example.dart';
import 'package:tryflutter/views/pages/examples/inheritedwidget/example.dart';
import 'package:tryflutter/views/pages/examples/layouts/wrap/example.dart';
import 'package:tryflutter/views/pages/examples/return_value_from_screen/example.dart';
import 'package:tryflutter/views/pages/examples/show_material_banner/example.dart';
import 'package:tryflutter/views/pages/examples/statefulwidget/example.dart';
import 'package:tryflutter/views/pages/examples/statelesswidget/example.dart';
import 'package:tryflutter/views/pages/examples/stream_builder/example.dart';
import 'package:tryflutter/views/pages/examples/widget_opacity/example.dart';
import 'package:tryflutter/views/pages/examples/widget_visibility/example.dart';

/// [Home] の body 部分を表します.
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
        _btn(() {
          return const HelloWorldPage();
        }, 'Hello World'),
        _btn(() {
          return const StatelessWidgetPage();
        }, 'Stateless Widget'),
        _btn(() {
          return const ClockPage();
        }, 'Stateful Widget'),
        _btn(() {
          return const InheritedWidgetPage();
        }, 'Inherited Widget'),
        _btn(() {
          return const ButtonDisabledPage();
        }, 'Button Disabled'),
        _btn(() {
          return const FutureBuilderPage();
        }, 'Future Builder'),
        _btn(() {
          return const StreamBuilderPage();
        }, 'Stream Builder'),
        _btn(() {
          return const ReturnValueFromScreen();
        }, 'Return value from Screen'),
        _btn(() {
          return const CenterAndColumnVerticalSpace();
        }, 'Center and Column'),
        _btn(() {
          return const CenterAndRowHorizontalSpace();
        }, 'Center and Row'),
        _btn(() {
          return const ShowMaterialBanner();
        }, 'Show Material Banner'),
        _btn(() {
          return const Buttons();
        }, 'Buttons'),
        _btn(() {
          return const FullScreenLoading();
        }, 'Full Screen Loading'),
        _btn(() {
          return const WidgetVisibility();
        }, 'Widget Visibility'),
        _btn(() {
          return const WidgetOpacity();
        }, 'Widget Opacity'),
        _btn(() {
          return const WrapWidget();
        }, '[Layouts] Wrap'),
      ],
    );
  }

  Widget _btn(
    Widget Function() fn,
    String caption,
  ) {
    return ElevatedButton(
      onPressed: () => Get.to<Widget>(() => fn()),
      child: Text(caption),
    );
  }
}
