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
