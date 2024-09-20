// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/extension/dynamic.dart';
import 'package:general_lib/regexp_replace/regexp_replace.dart';
import 'package:universal_io/io.dart';

import "package:path/path.dart" as path;

extension ListExtensionStringGlob on List<RegExp> {
  bool globMatch(Object? value) {
    if (value is String) {
      for (final element in this) {
        if (element.hasMatch(value)) {
          return true;
        }
      }

      List<String> values = path.split(value);
      for (final element in this) {
        for (final  sub_value in values) {
          if (element.hasMatch(sub_value)) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

extension StringExtension on String {
  List<String> toGlob() {
    final List<String> globs = [];
    for (final element_loop in split("\n")) {
      final element = element_loop.trim();
      if (RegExp("^#", caseSensitive: false).hasMatch(element)) {
        continue;
      }
      if (RegExp("^!", caseSensitive: false).hasMatch(element)) {
        continue;
      }
      if (element.isEmpty) {
        continue;
      }
      globs.add(element.toGlobPattern());
    }
    return globs;
  }

  List<RegExp> toGlobRegExp() {
    final List<RegExp> regexps = [];
    for (final element in split("\n")) {
      if (RegExp("^#", caseSensitive: false).hasMatch(element.trim())) {
        continue;
      }
      if (RegExp("^!", caseSensitive: false).hasMatch(element.trim())) {
        continue;
      }
      if (element.trim().isEmpty) {
        continue;
      }
      regexps.add(RegExp(element.toGlobPattern()));
    }
    return regexps;
  }

  String toGlobPattern() {
    final List<RegExpReplace> regExpMatchs = [
      RegExpReplace(
        from: RegExp(r"((.)?(\*))"),
        replace: (match) {
          String dot = match.group(2) ?? "";
          String two = match.group(3) ?? "";
          if (dot == ".") {
            return match.group(1) ?? "";
          }
          return "${dot}.${two}";
        },
      ),
      RegExpReplace(
        from: RegExp(r"((.)?(\.)(.)?)"),
        replace: (match) {
          String all = match.group(1) ?? "";
          if (RegExp("\\*", caseSensitive: false).hasMatch(all) == false) {
            return RegExp.escape(all);
          }
          // print(all);
          return all;
        },
      ),
    ];
    String result = this;
    for (final element in regExpMatchs) {
      result = result.replaceAllMapped(element.from, element.replace);
    }
    {
      final List<String> results = result.split("/");
      if (results.length == 1) {
        return "^${result}\$";
      }
    }
    return result;
  }
}

void main(List<String> args) {
  // print(ignore.toGlob());
  ignore.toGlob()
    ..sort()
    ..printPretty();
  List<RegExp> ignores = ignore.toGlobRegExp();
  for (var element in Directory.current.listSync(recursive: true)) {
    if (ignores.globMatch(element.path)) {
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
