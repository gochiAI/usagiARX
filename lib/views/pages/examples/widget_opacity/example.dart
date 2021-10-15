import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// `Opacity` の値を操作するコントローラーです.
class _OpacityController extends GetxController {
  final _opacity = 1.0.obs;

  double get opacity => _opacity.value;
  void toggle() => opacity == 1.0 ? _opacity.value = 0.0 : _opacity.value = 1.0;
}

/// [AnimatedOpacity] ウィジェットのサンプルです.
///
/// ### REFERENCES
/// - https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html
class WidgetOpacity extends StatelessWidget {
  const WidgetOpacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(_OpacityController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Opacity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedOpacity(
                opacity: c.opacity,
                duration: const Duration(seconds: 2),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('２秒かかって消えたり現れたりする'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: c.toggle,
              child: const Text('PUSH'),
            ),
          ],
        ),
      ),
    );
  }
}
