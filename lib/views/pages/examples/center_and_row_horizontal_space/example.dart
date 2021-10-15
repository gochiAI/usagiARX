import 'package:flutter/material.dart';

/// [Center]ウィジェットと[Row]ウィジェットのサンプルです.
///
/// ### REFERENCES
/// - https://stackoverflow.com/questions/41845693/how-can-i-tightly-wrap-a-column-of-widgets-inside-a-card
/// - https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
class CenterAndRowHorizontalSpace extends StatefulWidget {
  const CenterAndRowHorizontalSpace({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CenterAndRowHorizontalSpace> {
  var _axisSize = MainAxisSize.max;

  @override
  Widget build(BuildContext context) {
    Widget fn(Color c) {
      return Container(
        width: 100,
        height: 100,
        color: c,
      );
    }

    //
    // そのまま Row ウィジェットを Center ウィジェットで包むと
    // 画面の左部分に要素が表示される。これは、Row ウィジェットが
    // デフォルトでは横サイズ（Horizontal space) を可能な限り確保するように
    // なっているため。
    //
    // 横サイズの確保については、mainAxixSize プロパティで設定することが可能で
    // このプロパティにデフォルトの値は MainAxisSize.max となっている。
    //
    // なので、以下のように MainAxisSize.min を指定すると他のウィジェットと
    // 同じように中央に配置されるようになる。
    //
    // REFERENCES:
    //   - https://stackoverflow.com/questions/41845693/how-can-i-tightly-wrap-a-column-of-widgets-inside-a-card
    //   - https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Center and Row widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisSize: _axisSize,
            children: [
              fn(Colors.green),
              fn(Colors.blue),
              fn(Colors.red),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _axisSize = _axisSize == MainAxisSize.max
                          ? MainAxisSize.min
                          : MainAxisSize.max;
                    },
                  );
                },
                child: const Text('Toggle axis size'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
