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
class LanguageCodeDataDetail extends JsonScheme {
  /// Generated
  LanguageCodeDataDetail(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "languageCodeDataDetail",
      "name": "Zimbabwe",
      "flag": "🇿🇼",
      "code": "ZW",
      "dial_code": "+263"
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == languageCodeDataDetail
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

  /// create [LanguageCodeDataDetail]
  /// Empty
  static LanguageCodeDataDetail empty() {
    return LanguageCodeDataDetail({});
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
  String? get name {
    try {
      if (rawData["name"] is String == false) {
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set name(String? value) {
    rawData["name"] = value;
  }

  /// Generated
  String? get flag {
    try {
      if (rawData["flag"] is String == false) {
        return null;
      }
      return rawData["flag"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set flag(String? value) {
    rawData["flag"] = value;
  }

  /// Generated
  String? get code {
    try {
      if (rawData["code"] is String == false) {
        return null;
      }
      return rawData["code"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set code(String? value) {
    rawData["code"] = value;
  }

  /// Generated
  String? get dial_code {
    try {
      if (rawData["dial_code"] is String == false) {
        return null;
      }
      return rawData["dial_code"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set dial_code(String? value) {
    rawData["dial_code"] = value;
  }

  /// Generated
  static LanguageCodeDataDetail create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "languageCodeDataDetail",
    String? name,
    String? flag,
    String? code,
    String? dial_code,
  }) {
    // LanguageCodeDataDetail languageCodeDataDetail = LanguageCodeDataDetail({
    final Map languageCodeDataDetail_data_create_json = {
      "@type": special_type,
      "name": name,
      "flag": flag,
      "code": code,
      "dial_code": dial_code,
    };

    languageCodeDataDetail_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (languageCodeDataDetail_data_create_json.containsKey(key) == false) {
          languageCodeDataDetail_data_create_json[key] = value;
        }
      });
    }
    return LanguageCodeDataDetail(languageCodeDataDetail_data_create_json);
  }
}
