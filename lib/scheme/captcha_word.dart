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
class CaptchaWord extends JsonScheme {
  /// Generated
  CaptchaWord(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "captchaWord",
      "answer": [3, 5, 3],
      "words": ["satu", "dua", "tiga", "empat", "lima", "enam", "tujuh"]
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == captchaWord
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

  /// create [CaptchaWord]
  /// Empty
  static CaptchaWord empty() {
    return CaptchaWord({});
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
  ///
  /// default:
  ///
  ///
  List<num> get answer {
    try {
      if (rawData["answer"] is List == false) {
        return [];
      }
      return (rawData["answer"] as List).cast<num>();
    } catch (e) {
      return [];
    }
  }

  /// Generated
  set answer(List<num> value) {
    rawData["answer"] = value;
  }

  /// Generated
  ///
  /// default:
  ///
  ///
  List<String> get words {
    try {
      if (rawData["words"] is List == false) {
        return [];
      }
      return (rawData["words"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }

  /// Generated
  set words(List<String> value) {
    rawData["words"] = value;
  }

  /// Generated
  static CaptchaWord create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "captchaWord",
    List<num>? answer,
    List<String>? words,
  }) {
    // CaptchaWord captchaWord = CaptchaWord({
    final Map captchaWord_data_create_json = {
      "@type": special_type,
      "answer": answer,
      "words": words,
    };

    captchaWord_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (captchaWord_data_create_json.containsKey(key) == false) {
          captchaWord_data_create_json[key] = value;
        }
      });
    }
    return CaptchaWord(captchaWord_data_create_json);
  }
}
