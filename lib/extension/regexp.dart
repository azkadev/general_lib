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

import 'package:general_lib/scheme/reg_exp_data_scheme.dart';

extension GeneralLibRegExpExtension on RegExp {
  bool hashData(dynamic input) {
    try {
      if (input is String == false) {
        input = input.toString();
      }
      return hasMatch(input);
    } catch (e) {
      return false;
    }
  }

  RegExp fromJson(Map data) {
    RegExpDataScheme regExpDataScheme = RegExpDataScheme(data);
    return RegExp(
      regExpDataScheme.pattern ?? "",
      multiLine: regExpDataScheme.is_multi_line ?? false,
      caseSensitive: regExpDataScheme.is_case_sensitive ?? false,
      unicode: regExpDataScheme.is_unicode ?? false,
      dotAll: regExpDataScheme.is_dot_all ?? false,
    );
  }

  Map toJson() {
    return {
      "@type": "regExpDataScheme",
      "pattern": pattern,
      "is_multi_line": isMultiLine,
      "is_case_sensitive": isCaseSensitive,
      "is_unicode": isUnicode,
      "is_dot_all": isUnicode,
    };
  }
}

extension GeneralLibListRegExpExtension on List<RegExp> {
  bool hashData(dynamic input) {
    int count = 0;
    for (var i = 0; i < length; i++) {
      RegExp regExp = this[i];
      if (regExp.hashData(input)) {
        count++;
      }
    }
    return (count == length);
  }
}

extension GeneralLibListListRegExpExtension on List<List<RegExp>> {
  bool hashData(dynamic input) {
    for (var i = 0; i < length; i++) {
      if (this[i].hashData(input)) {
        return true;
      }
    }
    return false;
  }
}
