// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class SocketConnection extends JsonScheme {

  
  SocketConnection(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"socketConnection","status":"connect"};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == socketConnection
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

  

  /// create [SocketConnection]
  /// Empty  
  static SocketConnection empty() {
    return SocketConnection({});
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


  
  String? get status {
    try {
      if (rawData["status"] is String == false){
        return null;
      }
      return rawData["status"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set status(String? value) {
    rawData["status"] = value;
  }


  
  static SocketConnection create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "socketConnection",
    String? status,
})  {
    // SocketConnection socketConnection = SocketConnection({
final Map socketConnection_data_create_json = {
  
      "@type": special_type,
      "status": status,


};


          socketConnection_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (socketConnection_data_create_json.containsKey(key) == false) {
          socketConnection_data_create_json[key] = value;
        }
      });
    }
return SocketConnection(socketConnection_data_create_json);


      }
}