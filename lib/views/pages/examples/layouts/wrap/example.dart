import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _Controller extends GetxController {
  static const max = 0;
  static const min = 0;

  final _count = 1.obs;

  int get count => _count.value;

  void increment() {
    if (_count.value == max) {
      return;
    }
    _count.value = _count.value + 1;
  }

  void decrement() {
    if (_count.value == min) {
      return;
    }
    _count.value = _count.value - 1;
  }
}

/// [Wrap]ウィジェットのサンプルです.
///
/// ### REFERENCES
/// - https://api.flutter.dev/flutter/widgets/Wrap-class.html
/// - https://qiita.com/kurun_pan/items/9cb15ad14c311cbc0071
/// - https://stackoverflow.com/questions/51125024/there-are-multiple-heroes-that-share-the-same-tag-within-a-subtree
/// - https://api.flutter.dev/flutter/foundation/ValueKey-class.html
class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(_Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Widget'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: Obx(
          () => Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            spacing: 50.0,
            runSpacing: 10.0,
            children: [
              for (var i = 0; i < c.count; i++)
                CircleAvatar(
                  key: ValueKey('$i'),
                  child: Text('${i + 1}'),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.up,
        children: [
          FloatingActionButton(
            key: const ValueKey('incr'),
            heroTag: 'incr',
            onPressed: c.increment,
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            key: const ValueKey('decr'),
            heroTag: 'decr',
            onPressed: c.decrement,
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
