// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/extension/dynamic.dart';
import 'package:general_lib/glob/glob.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
  List<RegExp> ignores = ignore.toGlobRegExp();
  for (var element in Directory.current.listSync(recursive: true)) {
    if (ignores.globContains(element.path)) {
      print(element.path);
    }
  }
}

String ignore = r"""
# https://dart.dev/guides/libraries/private-files
# Created by `dart pub`
.dart_tool/
*.mp3
temp/

*.json

*.js
*.exe
*.deb
*.sqlite-*
*.sqlite
docs/canvaskit
*/canvaskit
/build/
generate_glx_*
node_modules/
build/
ephemeral/
flutter/ephemeral
android/.gradle
android/flutter/ephemeral
linux/flutter/ephemeral
macos/Flutter/ephemeral
windows/ephemeral
data
tmp/
""";
