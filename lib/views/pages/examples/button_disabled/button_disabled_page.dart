import 'package:flutter/material.dart';

class ButtonDisabled extends StatelessWidget {
  const ButtonDisabled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Disabled'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('CAN PUSH'),
              ),
            ),
            const ElevatedButton(
              // onPressに null を設定するとボタンが無効化される
              onPressed: null,
              child: Text('NOT PUSH'),
            ),
          ],
        ),
      ),
    );
  }
}
