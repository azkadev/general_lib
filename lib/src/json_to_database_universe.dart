// ignore_for_file: empty_catches

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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names
//

import 'dart:convert';
import 'package:general_lib/general_lib.dart';

/// GeneralLibrary
JsonDataScript jsonToDatabaseUniverse(
  Map<String, dynamic> data, {
  String packageName = "database_universe",
  String className = "Root",
  bool isMain = true,
  bool isUseClassName = false,
  String? comment,
  int databaseUniverseVersion = 4,
}) {
  return JsonDataScript(
    className: className,
    datas: [
      jsonToIsarDynamic(
        data,
        className: className,
        isMain: isMain,
        isUseClassName: isUseClassName,
        comment: comment,
        databaseUniverseVersion: databaseUniverseVersion,
        packageName: packageName,
      ),
      """
part "${className.snakeCaseClass().toLowerCase()}.dart";
"""
    ],
    is_databaseUniverse: true,
  );
}

/// GeneralLibrary
JsonDataScript jsonToIsar(
  Map<String, dynamic> data, {
  String packageName = "database_universe",
  String className = "Root",
  bool isMain = true,
  bool isUseClassName = false,
  String? comment,
  int databaseUniverseVersion = 3,
}) {
  return JsonDataScript(
    className: className,
    datas: [
      jsonToIsarDynamic(
        data,
        className: className,
        isMain: isMain,
        isUseClassName: isUseClassName,
        comment: comment,
        databaseUniverseVersion: databaseUniverseVersion,
        packageName: packageName,
      ),
      """
part "${className.snakeCaseClass().toLowerCase()}.dart";
"""
    ],
    is_databaseUniverse: true,
  );
}

/// GeneralLibrary
String jsonToIsarDynamic(
  Map<String, dynamic> data, {
  required String packageName,
  String className = "Root",
  bool isMain = true,
  bool isUseClassName = false,
  String? comment,
  required int databaseUniverseVersion,
}) {
  comment ??= "";
  List<String> classMessages = [];
  className = className.camelCaseClass();
  String classMessage = """
${((isMain) ? """
// ignore_for_file: non_constant_identifier_names, unnecessary_this, public_member_api_docs

// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert';
import 'package:${packageName}/${packageName}.dart';
part "${className.snakeCaseClass().toLowerCase()}.g.dart";

@collection""" : "@embedded")} 
class ${className} { 
  
  // Id id = Isar.autoIncrement;

  ${() {
    if (isMain) {
      if (databaseUniverseVersion >= 4) {
        if (data["id"] is num == false) {
          return "int id = 0;";
        }
        return "";
      }
      return "Id databaseUniverse_data_id = Isar.autoIncrement;";
    }
    return "";
  }.call()}

""";

  // ${() {
  //   if (isMain) {
  //     if (!data.containsKey("id")) {
  //       return "Id id = Isar.autoIncrement;";
  //     }
  //   }
  //   return "";
  // }.call()}

  String classDataCreate = """

  ${comment}
  static ${className} create({
    bool utils_is_print_data = false,

""";

  // String classDataCreateData = "";

  String dataToJson = """{
  
""";

  String operator_data = "";

  data.forEach((key, value) {
    String nameClass = key.camelCaseClass();
    if (isUseClassName) {
      nameClass = "${className}${key.camelCaseClass()}";
    }

    if (value is String) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "String",
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    }
    if (value is int) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "int",
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    } else if (value is double) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "double",
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    } else if (value is num) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "num",
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    }
    if (value is bool) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "bool",
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    }
    if (value is Map) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "Map",
        isClass: true,
        isUseClassName: isUseClassName,
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
      classMessages.add(jsonToIsar(
        value.cast<String, dynamic>(),
        className: nameClass,
        isMain: false,
        isUseClassName: isUseClassName,
        comment: comment,
        databaseUniverseVersion: databaseUniverseVersion,
      ).first);
    }

    if (value is List) {
      if (value.isNotEmpty) {
        if (value.first is Map) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "Map",
            isClass: true,
            isUseClassName: isUseClassName,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
          classMessages.add(
            jsonToIsar(
              (value.first as Map).cast<String, dynamic>(),
              className: nameClass,
              isMain: false,
              isUseClassName: isUseClassName,
              comment: comment,
              databaseUniverseVersion: databaseUniverseVersion,
            ).first,
          );
        }
        if (value.first is bool) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "bool",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        }
        if (value.first is String) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "String",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        }
        if (value.first is int) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "int",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        } else if (value.first is double) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "double",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        } else if (value.first is num) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "num",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        }
        if (value.first == null) {
          classMessage += textToFunctionIsar(
            key: key,
            value: value,
            className: className,
            returnType: "Object",
            isClass: false,
            isList: true,
            comment: comment,
            callback: (text) {},
            paramFunction: (text) {},
            paramJson: (text) {
              dataToJson += text;
            },
            operatorData: (text) {
              operator_data += text;
            },
          );
        }
      } else {
        classMessage += textToFunctionIsar(
          key: key,
          value: value,
          className: className,
          returnType: "Object",
          isClass: false,
          isList: true,
          comment: comment,
          callback: (text) {},
          paramFunction: (text) {},
          paramJson: (text) {
            dataToJson += text;
          },
          operatorData: (text) {
            operator_data += text;
          },
        );
      }
    }

    if (value == null) {
      classMessage += textToFunctionIsar(
        key: key,
        value: value,
        className: className,
        returnType: "Object",
        isClass: false,
        isList: false,
        comment: comment,
        callback: (text) {},
        paramFunction: (text) {},
        paramJson: (text) {
          dataToJson += text;
        },
        operatorData: (text) {
          operator_data += text;
        },
      );
    }
  });
  //
  dataToJson += "\n\n  }";

  classDataCreate += "\n\n}) {";
  classDataCreate += """

    ${className} ${className[0].toLowerCase() + className.substring(1, className.length)}_data_create = ${className}();
    

    if (utils_is_print_data){
      // print(${className[0].toLowerCase() + className.substring(1, className.length)}_data_create.toStringPretty());
    }
 
    return ${className[0].toLowerCase() + className.substring(1, className.length)}_data_create;
 """;

  classDataCreate += "\n\n}";
  classMessage += """
 
  /// operator map data
   operator [](key) {
    return toJson()[key];
  }
 
  /// operator map data
  void operator []=(key, value) {
    ${operator_data}
  }


  /// return original data json
  Map utils_remove_values_null() {
    Map rawData = toJson(); 
    rawData.forEach((key, value) {
      if (value == null) {
        rawData.remove(key);
      }
    });
    return rawData;
  }
 
  /// return original data json
  Map utils_remove_by_values(List values) {
    Map rawData = toJson();  
    rawData.forEach((key, value) {
      for (var element in values) {
        if (value == element) {
          rawData.remove(key);
        }
      }
    });


    return rawData;
  } 

  /// return original data json
  Map utils_remove_by_keys(List keys) {
    Map rawData = toJson();   
    for (var element in keys) {
      rawData.remove(element);
    }
    return rawData;
  }

  /// return original data json
  Map utils_filter_by_keys(List keys) {
    Map rawData = toJson();   
    Map jsonData = {};
    for (var key in keys) {
      jsonData[key] = rawData[key];
    }
    return jsonData;
  }


  /// return original data json
  Map toMap() {
    return toJson();
  }

  /// return original data json
  Map toJson() {
    return ${dataToJson};
  }



  /// return string data encode json original data
  String toStringPretty() {
    return JsonEncoder.withIndent(" " * 2).convert(toJson());
  }


  /// return string data encode json original data
  @override
  String toString() {
    return json.encode(toJson());
  }


  /// return original data json
  static Map get defaultData {
    return ${json.encode(data)};
  }

  ${classDataCreate}

}""";

  classMessage += "\n\n${classMessages.join("\n\n")}";
  return classMessage;
}

/// GeneralLibrary
String textToFunctionIsar({
  required String key,
  required value,
  required String returnType,
  required String className,
  bool isClass = false,
  bool isList = false,
  bool isUseClassName = false,
  String? comment,
  required void Function(String text) callback,
  required void Function(String text) paramFunction,
  required void Function(String text) paramJson,
  required void Function(String text) operatorData,
}) {
  comment ??= "";
  if (value is String) {
    value = json.encode(value);
  }
  String nameClass = key.camelCaseClass();
  if (isUseClassName) {
    nameClass = "${className}${key.camelCaseClass()}";
  }

  String nameMethod = key.replaceAll(RegExp(r"^(@|[0-9]+)", caseSensitive: false), "special_").replaceAll(RegExp(r"([\-]+)", caseSensitive: false), "_").replaceAll(RegExp(r"^(_)", caseSensitive: false), "special_");
  if (RegExp(r"^(do|is|in)$", caseSensitive: false).hasMatch(nameMethod)) {
    nameMethod += "_";
  }

//   operatorData.call("""

//     if (key == "${key}") {
//       ${nameMethod} = value;
//     }

// """);

  if (isClass) {
    if (isList) {
      operatorData.call("""


    if (key == "${key}") {
      if (value is List<${nameClass}>) {
        // new method remove this. if not work
        this.${nameMethod} = value;
      } else {
        
        this.${nameMethod} = (value as List).map((state_data_procces) {
          ${nameClass} state_value_procces = ${nameClass}();
          (state_data_procces as Map).forEach((key, value) {
            state_value_procces[key] = value;
          });
          return state_value_procces;
        }).toList().cast<${nameClass}>();

      }
    }


""");
      paramFunction.call("""
      List<${nameClass}?>? ${nameMethod},
""");
      // paramJson.call("""
      // "${key}": (${nameMethod} != null)?${nameMethod}.map((res) => res.toJson()).toList().cast<Map>():null,
// """);
      paramJson.call("""
      "${key}":  ${nameMethod}.map((res) => res.toJson()).toList().cast<Map>(),
""");
      callback.call("""
      try {
        if (rawData["${key}"] is List == false){
          ${nameMethod}  = null;
        }
        ${nameMethod} = (rawData["${key}"] as List).map((e) => ${nameClass}(e as $returnType)).toList().cast<${nameClass}>();
      } catch (e) {
        ${nameMethod}  = null;
      }
""");
      return """
  ${comment}
  List<${nameClass}> ${nameMethod} = [];

""";
    }
    operatorData.call("""

    if (key == "${key}") {
      if (value is ${nameClass}) {
        this.${nameMethod} = value;
      } else {
        ${nameClass} state_value_procces = ${nameClass}();
        (value as Map).forEach((key, value) {
          state_value_procces[key] = value;
        });
        this.${nameMethod} = state_value_procces;
      }
    }


""");
    paramFunction.call("""
      ${nameClass}? ${nameMethod},
""");
    // paramJson.call("""
    // "${key}": (${nameMethod} != null)?${nameMethod}.toJson(): null,
// """);
    paramJson.call("""
      "${key}":  ${nameMethod}.toJson(),
""");
    callback.call("""
      try {
        if (rawData["${key}"] is ${returnType} == false){
          ${nameMethod}  =  ${nameClass}({});
        }
        ${nameMethod} = ${nameClass}(rawData["${key}"] as $returnType);
      } catch (e) {
        ${nameMethod}  = ${nameClass}({}); 
      }
""");
    return """

  ${comment}
  ${nameClass} ${nameMethod} = ${nameClass}();

""";
  }

  operatorData.call("""


    if (key == "${key}") {
      this.${nameMethod} = value;
    }


""");

  if (isList) {
    paramFunction.call("""
      List<${returnType}?>? ${nameMethod},
""");
    paramJson.call("""
      "${key}": ${nameMethod},
""");
    callback.call("""
      try {
        if (rawData["${key}"] is List == false){
          ${nameMethod}  = null;
        }
        ${nameMethod} = (rawData["${key}"] as List).cast<${returnType}>();
      } catch (e) {
        ${nameMethod}  = null;
      }
""");
    return """

  ${comment}
  List<${returnType}> ${nameMethod} = ${value};

""";
  }

  paramFunction.call("""
    $returnType? ${nameMethod},
""");
  paramJson.call("""
      "${key}": ${nameMethod},
""");
  callback.call("""
      try {
        if (rawData["${key}"] is ${returnType} == false){
          ${nameMethod}  = null;
        }
        ${nameMethod} = rawData["${key}"] as ${returnType};
      } catch (e) {
        ${nameMethod}  = null;
      }
""");
  return """

  ${comment}
  $returnType ${nameMethod} = ${value};

""";
}
