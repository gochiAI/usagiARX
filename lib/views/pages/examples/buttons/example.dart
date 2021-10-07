import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //https://medium.com/flutterdevs/flutter-2-0-button-cheat-sheet-93217b3c908a
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _textButtons(),
            _elevatedButtons(),
            _outlinedButtons(),
          ],
        ),
      ),
    );
  }

  Widget _textButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('TextButton (Default)'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('TextButton (Custom)'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
        ),
      ],
    );
  }

  Widget _elevatedButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('ElevatedButton (Default)'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('ElevatedButton (Custom)'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(30.0),
          ),
        ),
      ],
    );
  }

  Widget _outlinedButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('OutlinedButton'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('OutlinedButton (Custom)'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(50.0),
            side: const BorderSide(width: 2, color: Colors.green),
          ),
        ),
      ],
    );
  }
}
