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
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class RegExpDataScheme extends JsonScheme {
  /// Generated
  RegExpDataScheme(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "regExpDataScheme",
      "pattern": "",
      "is_multi_line": false,
      "is_case_sensitive": false,
      "is_unicode": false,
      "is_dot_all": false
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == regExpDataScheme
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [RegExpDataScheme]
  /// Empty
  static RegExpDataScheme empty() {
    return RegExpDataScheme({});
  }

  /// Generated
  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
  String? get pattern {
    try {
      if (rawData["pattern"] is String == false) {
        return null;
      }
      return rawData["pattern"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set pattern(String? value) {
    rawData["pattern"] = value;
  }

  /// Generated
  bool? get is_multi_line {
    try {
      if (rawData["is_multi_line"] is bool == false) {
        return null;
      }
      return rawData["is_multi_line"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_multi_line(bool? value) {
    rawData["is_multi_line"] = value;
  }

  /// Generated
  bool? get is_case_sensitive {
    try {
      if (rawData["is_case_sensitive"] is bool == false) {
        return null;
      }
      return rawData["is_case_sensitive"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_case_sensitive(bool? value) {
    rawData["is_case_sensitive"] = value;
  }

  /// Generated
  bool? get is_unicode {
    try {
      if (rawData["is_unicode"] is bool == false) {
        return null;
      }
      return rawData["is_unicode"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_unicode(bool? value) {
    rawData["is_unicode"] = value;
  }

  /// Generated
  bool? get is_dot_all {
    try {
      if (rawData["is_dot_all"] is bool == false) {
        return null;
      }
      return rawData["is_dot_all"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_dot_all(bool? value) {
    rawData["is_dot_all"] = value;
  }

  /// Generated
  static RegExpDataScheme create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "regExpDataScheme",
    String? pattern,
    bool? is_multi_line,
    bool? is_case_sensitive,
    bool? is_unicode,
    bool? is_dot_all,
  }) {
    // RegExpDataScheme regExpDataScheme = RegExpDataScheme({
    final Map regExpDataScheme_data_create_json = {
      "@type": special_type,
      "pattern": pattern,
      "is_multi_line": is_multi_line,
      "is_case_sensitive": is_case_sensitive,
      "is_unicode": is_unicode,
      "is_dot_all": is_dot_all,
    };

    regExpDataScheme_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (regExpDataScheme_data_create_json.containsKey(key) == false) {
          regExpDataScheme_data_create_json[key] = value;
        }
      });
    }
    return RegExpDataScheme(regExpDataScheme_data_create_json);
  }
}
