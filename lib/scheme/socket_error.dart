// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class SocketError extends JsonScheme {

  
  SocketError(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"socketError","message":"","description":"","error":"e"};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == socketError
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

  

  /// create [SocketError]
  /// Empty  
  static SocketError empty() {
    return SocketError({});
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


  
  String? get message {
    try {
      if (rawData["message"] is String == false){
        return null;
      }
      return rawData["message"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set message(String? value) {
    rawData["message"] = value;
  }


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set description(String? value) {
    rawData["description"] = value;
  }


  
  String? get error {
    try {
      if (rawData["error"] is String == false){
        return null;
      }
      return rawData["error"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set error(String? value) {
    rawData["error"] = value;
  }


  
  static SocketError create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "socketError",
    String? message,
    String? description,
    String? error,
})  {
    // SocketError socketError = SocketError({
final Map socketError_data_create_json = {
  
      "@type": special_type,
      "message": message,
      "description": description,
      "error": error,


};


          socketError_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (socketError_data_create_json.containsKey(key) == false) {
          socketError_data_create_json[key] = value;
        }
      });
    }
return SocketError(socketError_data_create_json);


      }
}