import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _Controller extends GetxController {
  static const maxWidth = 300.0;
  static const maxHeight = 300.0;

  final _isExpand = false.obs;

  bool get isExpand => _isExpand.value;
  void toggle() => _isExpand.value = !_isExpand.value;
}

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(_Controller());

    const maxW = _Controller.maxWidth;
    const maxH = _Controller.maxHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: maxW,
          height: maxH,
          child: Obx(
            () => Stack(
              fit: c.isExpand ? StackFit.expand : StackFit.loose,
              children: [
                Container(
                  width: maxW,
                  height: maxH,
                  color: Colors.yellow,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
                  width: maxW / 2,
                  height: maxH / 2,
                  color: Colors.red,
                ),
                SizedBox(
                  width: maxW,
                  height: maxH,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      child: const Text('toggle StackFit'),
                      onPressed: c.toggle,
                    ),
                  ),
                ),
                SizedBox(
                  width: maxW,
                  height: maxH,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(c.isExpand ? 'expand' : 'loose'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
