// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/regexp_replace/regexp_replace.dart';

import "package:path/path.dart" as path;

extension GlobGeneralLibExtensionListRegExp on List<RegExp> {
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

extension GlobGeneralLibExtensionString on String {
  List<String> toGlob() {
    final List<String> globs = [];
    for (final elementLoop in split("\n")) {
      final element = elementLoop.trim();
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
