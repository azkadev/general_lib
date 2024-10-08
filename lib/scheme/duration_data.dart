// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class DurationData extends JsonScheme {
  DurationData(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "durationData",
      "days": 0,
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "milliseconds": 0,
      "microseconds": 0
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == durationData
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

  /// create [DurationData]
  /// Empty
  static DurationData empty() {
    return DurationData({});
  }

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

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  num? get days {
    try {
      if (rawData["days"] is num == false) {
        return null;
      }
      return rawData["days"] as num;
    } catch (e) {
      return null;
    }
  }

  set days(num? value) {
    rawData["days"] = value;
  }

  num? get hours {
    try {
      if (rawData["hours"] is num == false) {
        return null;
      }
      return rawData["hours"] as num;
    } catch (e) {
      return null;
    }
  }

  set hours(num? value) {
    rawData["hours"] = value;
  }

  num? get minutes {
    try {
      if (rawData["minutes"] is num == false) {
        return null;
      }
      return rawData["minutes"] as num;
    } catch (e) {
      return null;
    }
  }

  set minutes(num? value) {
    rawData["minutes"] = value;
  }

  num? get seconds {
    try {
      if (rawData["seconds"] is num == false) {
        return null;
      }
      return rawData["seconds"] as num;
    } catch (e) {
      return null;
    }
  }

  set seconds(num? value) {
    rawData["seconds"] = value;
  }

  num? get milliseconds {
    try {
      if (rawData["milliseconds"] is num == false) {
        return null;
      }
      return rawData["milliseconds"] as num;
    } catch (e) {
      return null;
    }
  }

  set milliseconds(num? value) {
    rawData["milliseconds"] = value;
  }

  num? get microseconds {
    try {
      if (rawData["microseconds"] is num == false) {
        return null;
      }
      return rawData["microseconds"] as num;
    } catch (e) {
      return null;
    }
  }

  set microseconds(num? value) {
    rawData["microseconds"] = value;
  }

  static DurationData create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "durationData",
    num? days,
    num? hours,
    num? minutes,
    num? seconds,
    num? milliseconds,
    num? microseconds,
  }) {
    // DurationData durationData = DurationData({
    final Map durationData_data_create_json = {
      "@type": special_type,
      "days": days,
      "hours": hours,
      "minutes": minutes,
      "seconds": seconds,
      "milliseconds": milliseconds,
      "microseconds": microseconds,
    };

    durationData_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (durationData_data_create_json.containsKey(key) == false) {
          durationData_data_create_json[key] = value;
        }
      });
    }
    return DurationData(durationData_data_create_json);
  }
}
