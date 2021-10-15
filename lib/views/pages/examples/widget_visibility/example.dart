import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 表示/非表示を管理するコントローラーです.
///
/// ### REFERENCES
/// - https://pub.dev/packages/get
class _VisibleController extends GetxController {
  final _visible = true.obs;

  bool get visible => _visible.value;
  void toggle() => _visible.value = !_visible.value;
}

/// Visibility ウィジェットのサンプルです.
///
/// ### REFERENCES
/// - https://api.flutter.dev/flutter/widgets/Visibility/Visibility.html
/// - https://zenn.dev/junki555/articles/038ed853bd72757e7ac2
/// - https://pub.dev/packages/get
class WidgetVisibility extends StatelessWidget {
  const WidgetVisibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c1 = Get.put(_VisibleController(), tag: 'btn1');
    final c2 = Get.put(_VisibleController(), tag: 'btn2');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Visibility'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Visibility(
                visible: c1.visible,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true, // 非表示でも元のサイズを保つ
                child: ElevatedButton(
                  onPressed: c2.toggle,
                  child: Text(c2.visible ? '下のボタンを消す' : '下のボタンを表示'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => Visibility(
                visible: c2.visible,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: false, // 非表示になると元のサイズは保たない
                child: ElevatedButton(
                  onPressed: c1.toggle,
                  child: Text(c1.visible ? '上のボタンを消す' : '上のボタンを表示'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
