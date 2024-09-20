// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/regexp_replace/regexp_replace.dart';

import "package:path/path.dart" as path;

extension GlobGeneralLibExtensionListRegExp on List<RegExp> {
  bool globContains(Object? value) {
    if (value is String) {
      for (final element in this) {
        if (element.hasMatch(value)) {
          return true;
        }
      }
      final values = path.split(value);
      // values.contains(element);
      for (final element in this) {
        for (final subValue in values) {
          if (element.hasMatch(subValue)) {
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
      if (RegExp("^[#!]", caseSensitive: false).hasMatch(element)) {
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
    return toGlob().map((e) => RegExp(e)).toList();
  }

  String toGlobPattern() {
    String result = this;
    for (final element in globRegExpReplaces) {
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

final List<RegExpReplace> globRegExpReplaces = [
  RegExpReplace(
    from: RegExp(r"((\*)?(\*))(\*)?"),
    replace: (match) {
      return "*";
    },
  ),
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
