/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:general_lib/regexp_replace/regexp_replace.dart';

import "package:path/path.dart" as path;

/// GeneralLib
extension GlobGeneralLibExtensionListRegExp on List<RegExp> {
  /// GeneralLib
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

/// GeneralLib
extension GlobGeneralLibExtensionString on String {
  /// GeneralLib
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

  /// GeneralLib
  List<RegExp> toGlobRegExp() {
    return toGlob().map((e) => RegExp(e)).toList();
  }

  /// GeneralLib
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

/// GeneralLib
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
