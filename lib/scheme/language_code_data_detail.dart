// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class LanguageCodeDataDetail extends JsonScheme {

  
  LanguageCodeDataDetail(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"languageCodeDataDetail","name":"Zimbabwe","flag":"🇿🇼","code":"ZW","dial_code":"+263"};
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


  
  String? get name {
    try {
      if (rawData["name"] is String == false){
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set name(String? value) {
    rawData["name"] = value;
  }


  
  String? get flag {
    try {
      if (rawData["flag"] is String == false){
        return null;
      }
      return rawData["flag"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set flag(String? value) {
    rawData["flag"] = value;
  }


  
  String? get code {
    try {
      if (rawData["code"] is String == false){
        return null;
      }
      return rawData["code"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set code(String? value) {
    rawData["code"] = value;
  }


  
  String? get dial_code {
    try {
      if (rawData["dial_code"] is String == false){
        return null;
      }
      return rawData["dial_code"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set dial_code(String? value) {
    rawData["dial_code"] = value;
  }


  
  static LanguageCodeDataDetail create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "languageCodeDataDetail",
    String? name,
    String? flag,
    String? code,
    String? dial_code,
})  {
    // LanguageCodeDataDetail languageCodeDataDetail = LanguageCodeDataDetail({
final Map languageCodeDataDetail_data_create_json = {
  
      "@type": special_type,
      "name": name,
      "flag": flag,
      "code": code,
      "dial_code": dial_code,


};


          languageCodeDataDetail_data_create_json.removeWhere((key, value) => value == null);

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