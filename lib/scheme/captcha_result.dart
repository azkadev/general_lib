// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "emoji.dart";

 
class CaptchaResult extends JsonScheme {

  
  CaptchaResult(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"captchaResult","type":"words","emoji_answer":{"@type":"emoji"},"random_words":[""],"words":[""]};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == captchaResult
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

  

  /// create [CaptchaResult]
  /// Empty  
  static CaptchaResult empty() {
    return CaptchaResult({});
  }

  

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  String? get type {
    try {
      if (rawData["type"] is String == false){
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set type(String? value) {
    rawData["type"] = value;
  }


  
  Emoji get emoji_answer {
    try {
      if (rawData["emoji_answer"] is Map == false){
        return Emoji({}); 
      }
      return Emoji(rawData["emoji_answer"] as Map);
    } catch (e) {  
      return Emoji({}); 
    }
  }


  
  set emoji_answer(Emoji value) {
    rawData["emoji_answer"] = value.toJson();
  }



  
  ///
  /// default:
  /// 
  /// 
  List<String> get random_words {
    try {
      if (rawData["random_words"] is List == false){
        return [];
      }
      return (rawData["random_words"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set random_words(List<String> value) {
    rawData["random_words"] = value;
  }


  
  ///
  /// default:
  /// 
  /// 
  List<String> get words {
    try {
      if (rawData["words"] is List == false){
        return [];
      }
      return (rawData["words"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set words(List<String> value) {
    rawData["words"] = value;
  }


  
  static CaptchaResult create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "captchaResult",
    String? type,
      Emoji? emoji_answer,
      List<String>? random_words,
      List<String>? words,
})  {
    // CaptchaResult captchaResult = CaptchaResult({
final Map captchaResult_data_create_json = {
  
      "@type": special_type,
      "type": type,
      "emoji_answer": (emoji_answer != null)?emoji_answer.toJson(): null,
      "random_words": random_words,
      "words": words,


};


          captchaResult_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (captchaResult_data_create_json.containsKey(key) == false) {
          captchaResult_data_create_json[key] = value;
        }
      });
    }
return CaptchaResult(captchaResult_data_create_json);


      }
}