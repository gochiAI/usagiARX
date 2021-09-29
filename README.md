# try-flutter
This is my TUTORIAL project for flutter.

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/devlights/try-flutter)

# リソース

- https://flutter.dev/docs
  - https://flutter.dev/docs/codelabs
- https://dart.dev/guides
- https://pub.dev/
- https://kodestat.gitbook.io/flutter/
- https://github.com/jonataslaw/getx
- https://github.com/Solido/awesome-flutter
- https://flutterawesome.com/
- https://codezine.jp/article/corner/830
- https://qiita.com/tags/flutter
- https://zenn.dev/topics/flutter
- https://stackoverflow.com/questions/tagged/flutter?sort=MostVotes&edited=true

# Run (Chrome)

```sh
$ flutter run -d chrome
```

# Run (Gitpod)

```sh
$ flutter run -d web-server
```

# VSCode

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "try-flutter (chrome)",
            "program": "lib/main.dart",
            "request": "launch",
            "type": "dart",
            "args": [
                "--device-id=chrome",
                "--web-renderer=html"
            ],
            "flutterMode": "debug"
        }
    ]
}
```