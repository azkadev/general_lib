// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class Emoji extends JsonScheme {

  
  Emoji(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"emoji"};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == emoji
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

  

  /// create [Emoji]
  /// Empty  
  static Emoji empty() {
    return Emoji({});
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


  
  static Emoji create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "emoji",
})  {
    // Emoji emoji = Emoji({
final Map emoji_data_create_json = {
  
      "@type": special_type,


};


          emoji_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (emoji_data_create_json.containsKey(key) == false) {
          emoji_data_create_json[key] = value;
        }
      });
    }
return Emoji(emoji_data_create_json);


      }
}