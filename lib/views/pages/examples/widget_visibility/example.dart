import 'package:flutter/material.dart';

class WidgetVisibility extends StatefulWidget {
  const WidgetVisibility({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<WidgetVisibility> {
  var _btn1Visible = true;
  var _btn2Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Visibility'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: _btn1Visible,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: ElevatedButton(
                onPressed: () => setState(() => _btn2Visible = !_btn2Visible),
                child: Text(_btn2Visible ? '下のボタンを消す' : '下のボタンを表示'),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: _btn2Visible,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: false,
              child: ElevatedButton(
                onPressed: () => setState(() => _btn1Visible = !_btn1Visible),
                child: Text(_btn1Visible ? '上のボタンを消す' : '上のボタンを表示'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
