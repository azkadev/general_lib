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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, depend_on_referenced_packages
//

import 'dart:convert';
import 'package:general_lib/general_lib.dart' as glx_lib;
import 'package:io_universe/io_universe.dart';
import "package:path/path.dart" as p;

/// GeneralLib
class JsonDatasScript {
  /// GeneralLib
  List<String> datas;

  /// GeneralLib
  JsonDatasScript({
    required this.datas,
  });
}

/// GeneralLib
Future<Directory> jsonToScripts(
  List<Map> scripts_origin, {
  String comment = "/// Generated",
  bool isMethodApi = true,
  required Directory directory,
  String path_package_json_dart = "import \"package:general_lib/general_lib.dart\";",
  int try_loop = 2,
}) async {
  // String base_name = p.basename(directory.path);
  // String baseName = base_name.camelCaseClass();
  List<Map> scripts = [...scripts_origin];
  if (!directory.existsSync()) {
    await directory.create(recursive: true);
  }

  for (var loop_index_first = 0; loop_index_first < try_loop; loop_index_first++) {
    // print(loop_index_first);
    void json_script_update({
      required Map newData,
      required String keyData,
    }) {
      if (newData["@type"] is String == false) {
        newData["@type"] = keyData;
      }
      for (var i = 0; i < scripts.length; i++) {
        Map data = scripts[i];
        if (newData["@type"] == data["@type"]) {
          newData.forEach((key, value) {
            if (value is Map) {
              if (value["@type"] is String == false) {
                scripts[i][key] = {
                  "@type": key,
                  ...value,
                };
                json_script_update(
                  newData: scripts[i][key],
                  keyData: keyData,
                );
              } else {
                json_script_update(
                  newData: value,
                  keyData: keyData,
                );
              }
            } else if (value is List) {
              void json_list_update({
                required List values,
                required String key,
              }) {
                for (var index = 0; index < values.length; index++) {
                  dynamic value_data = values[index];
                  if (value_data is Map) {
                    if (value_data["@type"] is String == false) {
                      if (scripts[i][key][index] is Map) {
                        final Map newValueJsonData = {
                          "@type": key,
                          ...value_data,
                        };
                        try {
                          scripts[i][key][index] = newValueJsonData;
                        } catch (e) {
                          newValueJsonData.forEach((nVJDK, nVJDKV) {
                            scripts[i][key][index][nVJDK] = nVJDKV;
                          });
                        }
                        json_script_update(
                          newData: scripts[i][key][index],
                          keyData: keyData,
                        );
                      }
                    } else {
                      json_script_update(
                        newData: value_data,
                        keyData: keyData,
                      );
                    }
                  } else if (value_data is List) {
                    json_list_update(values: value_data, key: key);
                  }
                }
              }

              json_list_update(values: value, key: key);
            } else {
              data[key] = value;
            }
          });
          return;
        }
      }
      if (newData["@type"] is String) {
        scripts.add(newData);
        json_script_update(
          newData: newData,
          keyData: keyData,
        );
      } else {
        // print(newData);
      }
    }

    void json_list_update({required List values, required String key}) {
      for (var index = 0; index < values.length; index++) {
        dynamic value_data = values[index];
        if (value_data is Map) {
          json_script_update(newData: value_data, keyData: key);
        } else if (value_data is List) {
          json_list_update(values: value_data, key: key);
        }
      }
    }

    for (var i = 0; i < scripts.length; i++) {
      Map data = scripts[i];
      if (data["@type"] is String == false) {
        continue;
      }

      data.forEach((key, value) {
        if (value is Map) {
          if (value["@type"] is String == false) {
            scripts[i][key] = {"@type": key, ...value};
            json_script_update(
              newData: scripts[i][key],
              keyData: key,
            );
          } else {
            json_script_update(
              newData: value.clone(),
              keyData: key,
            );
          }
        } else if (value is List) {
          json_list_update(
            values: value.clone(),
            key: key,
          );
        } else {}
      });
    }
  }

  List<String> datas = [];

  for (var i = 0; i < scripts.length; i++) {
    Map data = scripts[i];
    if (data["@type"] is String == false) {
      continue;
    }
    datas.add("export \"${data["@type"].toString().snakeCaseClass()}.dart\";");
    var res = jsonToScriptStatic(
      data.cast<String, dynamic>(),
      directory: directory,
      isMethodApi: isMethodApi,
      comment: comment,
      path_package_json_dart: path_package_json_dart,
    );
    await File(p.join(directory.path, "${data["@type"].toString().snakeCaseClass()}.dart")).writeAsString(res);
  }

//   String json_dart = """
// // ignore_for_file: non_constant_identifier_names, unused_import
// import 'dart:convert';

// /// return original data json
// class Json${baseName} {

//   /// return original data json
//   Map rawData;

//   /// return original data json
//   Json${baseName}(this.rawData);

//   /// return original data json
//   static Map get defaultData {
//     return {
//       "@type": "jsonDart",
//     };
//   }

//   /// return original data json
//   static Json${baseName} create({
//     String special_type = ${json.encode("Json${baseName}")},
//   }) {
//     Map jsonCreate = {
//       "@type": special_type,
//     };

//     jsonCreate.forEach((key, value) {
//       try {
//         if (value == null) {
//           jsonCreate.remove(key);
//           // jsonCreate[key] = value;
//         }
//       } catch (e, stack) {
//         print("Azka \${e.toString()}, \${stack.toString()}");
//       }
//     });
//     return Json${baseName}(jsonCreate);
//   }

//   /// operator map data
//   operator *(value) {}

//   /// operator map data
//   operator /(value) {}

//   /// operator map data
//   Map operator +(Map value) {
//     rawData.addAll(value);
//     return rawData;
//   }

//   /// return original data json
//   Map operator -(List values) {
//     utils_remove_by_keys_void(values);
//     return rawData;
//   }

//   /// operator map data
//   operator [](key) {
//     return rawData[key];
//   }

//   /// operator map data
//   void operator []=(key, value) {
//     rawData[key] = value;
//   }

//   /// return original data json
//   void utils_remove_values_null_void() {
//     rawData.forEach((key, value) {
//       if (value == null) {
//         rawData.remove(key);
//       }
//     });
//   }

//   /// return original data json
//   Map utils_remove_values_null() {
//     utils_remove_values_null_void();
//     return rawData;
//   }

//   /// return original data json
//   void utils_remove_by_values_void(List values) {
//     rawData.forEach((key, value) {
//       for (var element in values) {
//         if (value == element) {
//           rawData.remove(key);
//         }
//       }
//     });
//   }

//   /// return original data json
//   Map utils_remove_by_values(List values) {
//     utils_remove_by_values_void(values);
//     return rawData;
//   }

//   void utils_remove_by_keys_void(List keys) {
//     for (var element in keys) {
//       rawData.remove(element);
//     }
//   }

//   /// return original data json
//   Map utils_remove_by_keys(List keys) {
//     utils_remove_by_keys_void(keys);
//     return rawData;
//   }

//   /// return original data json
//   Map utils_filter_by_keys(List keys) {
//     Map jsonData = {};
//     for (var key in keys) {
//       jsonData[key] = rawData[key];
//     }
//     return jsonData;
//   }

//   /// return original data json
//   Map toMap() {
//     return rawData;
//   }

//   /// return original data json
//   Map toJson() {
//     return rawData;
//   }

//   /// return string data encode json original data
//   String toStringPretty() {
//     return JsonEncoder.withIndent(" " * 2).convert(toJson());
//   }

//   /// return string data encode json original data
//   @override
//   String toString() {
//     return json.encode(rawData);
//   }
// }

// extension Json${baseName}Extensions on List<Json${baseName}> {
//   List<Map> toJson() {
//     return map((e) => e.toJson()).toList().cast<Map>();
//   }

//   /// return string data encode json original data
//   String toStringPretty() {
//     return JsonEncoder.withIndent(" " * 2).convert(toJson());
//   }
// }

// """;
  datas.sort();
  // await File(p.join(directory.path, "json_dart.dart")).writeAsString(json_dart);
  await File(p.join(directory.path, "${p.basename(directory.path)}.dart")).writeAsString(datas.toSet().toList().join("\n"));

  return directory;
}

/// GeneralLib
String jsonToScriptStatic(
  Map<String, dynamic> data, {
  bool isMethodApi = true,
  required String? comment,
  required Directory directory,
  String path_package_json_dart = "import \"package:general_lib/general_lib.dart\";",
}) {
  // String base_name = p.basename(directory.path);
  // String baseName = base_name.camelCaseClass();
  comment ??= "";
  // List<String> classMessages = [];
  final String className = data["@type"].toString().camelCaseClass();
  final String class_name = className[0].toLowerCase() + className.substring(1, className.length);
  String package_data = "";
  String classMessage = """
// ignore_for_file: non_constant_identifier_names, unused_import
${path_package_json_dart}
// import "dart:convert";
{package_data}

${comment} 
class ${className} extends JsonScheme {

  ${comment}
  ${className}(super.rawData);
  
  /// return default special type @type
  /// ${json.encode(data["@type"])}
  static String get defaultDataSpecialType {
    return ${json.encode(data["@type"])};
  }

  /// return default data
  /// 
  static Map get defaultData {
    return ${json.encode(data)};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == ${data["@type"]}
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

  

  /// create [${className}]
  /// Empty  
  static ${className} empty() {
    return ${className}({});
  }

  
""";

  String classDataCreate = """

  ${comment}
  static ${className} create({
              bool schemeUtilsIsSetDefaultData = false,

""";
  String classDataCreateJson = """

    // ${className} ${class_name} = ${className}({
final Map ${class_name}_data_create_json = {
  
""";
  data.forEach((key, value) {
    if (value is String) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "String",
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    }
    if (value is double) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "double",
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    } else if (value is num) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "num",
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    } else if (value is int) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "int",
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    }
    if (value is bool) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "bool",
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    }
    if (value is Map) {
      // package_data += "\nimport \"${className.snakeCaseClass()}.dart\"";
      String value_class_name = () {
        if (value["@type"] is String && (value["@type"] as String).isNotEmpty) {
          return value["@type"];
        } else {
          return key;
        }
      }();
      package_data += "\nimport \"${value_class_name.snakeCaseClass()}.dart\";";
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        // className: className,
        className: value_class_name.camelCaseClass(),
        returnType: "Map",
        isClass: true,
        // isUseClassName: isUseClassName,
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );

      // classMessages.add(
      //   jsonToScript(
      //     value.cast<String, dynamic>(),
      //     className: nameClass,
      //     isMain: false,
      //     // isUseClassName: isUseClassName,
      //     comment: comment,
      //     directory: directory,
      //   ).first,
      // );
      return;
    }

    if (value is List) {
      if (value.isNotEmpty) {
        if (value.first is List) {
          List values = value.first;
          if (values.isNotEmpty) {
            if (values.first is Map) {
              String value_class_name = () {
                if (values.first["@type"] is String && (values.first["@type"] as String).isNotEmpty) {
                  return values.first["@type"];
                }
                return key;
              }();
              package_data += "\nimport \"${value_class_name.snakeCaseClass()}.dart\";";
              classMessage += textToListFunction(
                key: key,
                className: value_class_name.camelCaseClass(),
                returnType: "Map",
                isClass: true,
                // isUseClassName: isUseClassName,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first is bool) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "bool",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first is String) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "String",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first is double) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "double",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first is num) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "num",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first is int) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "int",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else if (values.first == null) {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "Object",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            } else {
              classMessage += textToListFunction(
                key: key,
                className: className,
                returnType: "Object",
                isClass: false,
                isList: true,
                comment: comment,
                paramFunction: (text) {
                  classDataCreate += text;
                },
                paramJson: (text) {
                  classDataCreateJson += text;
                },
              );
            }
          } else {
            classMessage += textToListFunction(
              key: key,
              className: className,
              returnType: "Object",
              isClass: false,
              isList: true,
              comment: comment,
              paramFunction: (text) {
                classDataCreate += text;
              },
              paramJson: (text) {
                classDataCreateJson += text;
              },
            );
          }
          return;
        }
        if (value.first is Map) {
          // package_data += "${className.snakeCaseClass()}.dart";
          String value_class_name = () {
            if (value.first["@type"] is String && (value.first["@type"] as String).isNotEmpty) {
              return value.first["@type"];
            }
            return key;
          }();
          package_data += "\nimport \"${value_class_name.snakeCaseClass()}.dart\";";
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: value_class_name.camelCaseClass(),
            returnType: "Map",
            isClass: true,
            // isUseClassName: isUseClassName,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
          // classMessages.add(
          //   jsonToScript(
          //     (value.first as Map).cast<String, dynamic>(),
          //     className: nameClass,
          //     isMain: false,
          //     // isUseClassName: isUseClassName,
          //     comment: comment,
          //     directory: directory,
          //   ).first,
          // );
        } else if (value.first is bool) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "bool",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else if (value.first is String) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "String",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else if (value.first is double) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "double",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else if (value.first is num) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "num",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else if (value.first is int) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "int",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else if (value.first == null) {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "Object",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        } else {
          classMessage += textToFunctionDart(
            key: key,
            value: value.first,
            className: className,
            returnType: "Object",
            isClass: false,
            isList: true,
            comment: comment,
            paramFunction: (text) {
              classDataCreate += text;
            },
            paramJson: (text) {
              classDataCreateJson += text;
            },
          );
        }
      } else {
        classMessage += textToFunctionDart(
          key: key,
          value: "",
          className: className,
          returnType: "Object",
          isClass: false,
          isList: true,
          comment: comment,
          paramFunction: (text) {
            classDataCreate += text;
          },
          paramJson: (text) {
            classDataCreateJson += text;
          },
        );
      }
      return;
    }

    if (value == null) {
      classMessage += textToFunctionDart(
        key: key,
        value: value,
        className: className,
        returnType: "Object",
        isClass: false,
        isList: false,
        comment: comment,
        paramFunction: (text) {
          classDataCreate += text;
        },
        paramJson: (text) {
          classDataCreateJson += text;
        },
      );
    }
  });

  classDataCreateJson += "\n\n};";
  classDataCreate += "})  {";
  final String json_name_create = "${class_name}_data_create_json";
  classDataCreate += """
${classDataCreateJson}


          ${json_name_create}.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (${json_name_create}.containsKey(key) == false) {
          ${json_name_create}[key] = value;
        }
      });
    }
return ${className}(${class_name}_data_create_json);
""";

  classDataCreate += "\n\n      }";

  classMessage += classDataCreate;

  classMessage += """

}""";

  // classMessage += "\n\n${classMessages.join("\n\n")}";/

  classMessage = classMessage.replaceAll(RegExp(r"{package_data}", caseSensitive: false), package_data.split("\n").toSet().toList().join("\n"));
  return classMessage;
}

/// GeneralLib
String textToFunctionDart({
  required String key,
  required dynamic value,
  required String returnType,
  required String className,
  bool isClass = false,
  bool isList = false,
  String? comment,
  required void Function(String text) paramFunction,
  required void Function(String text) paramJson,
}) {
  comment ??= "";
  String nameClass = className.camelCaseClass();

  String nameMethod = key.replaceAll(RegExp(r"^(@|[0-9]+)", caseSensitive: false), "special_").replaceAll(RegExp(r"([\-]+)", caseSensitive: false), "_").replaceAll(RegExp(r"^(_)", caseSensitive: false), "special_");
  if (RegExp(r"^(do|is|in)$", caseSensitive: false).hasMatch(nameMethod)) {
    nameMethod += "_";
  }

  if (isClass) {
    if (isList) {
      paramFunction.call("""
      List<${nameClass}>? ${nameMethod.toLowerCase()},
""");

// old
//       paramJson.call("""
//       "${key}": (${nameMethod} != null)? ${nameMethod}.map((res) => res.toJson()).toList().cast<Map>(): null,
// """);

      paramJson.call("""
      "${key}": (${nameMethod.toLowerCase()} != null)? ${nameMethod.toLowerCase()}.toJson(): null,
""");

      return """
  ${comment}
  List<${nameClass}> get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is List == false){
        return [];
      }
      return (rawData["${key}"] as List).map((e) => ${nameClass}(e as ${returnType})).toList().cast<${nameClass}>();
    } catch (e) {
      return [];
    }
  }


  ${comment}
  set ${nameMethod.toLowerCase()}(List<${nameClass}> values) {
    rawData["${key}"] = values.map((value) => value.toJson()).toList();
  }


""";
    }
    paramFunction.call("""
      ${nameClass}? ${nameMethod.toLowerCase()},
""");
    paramJson.call("""
      "${key}": (${nameMethod.toLowerCase()} != null)?${nameMethod.toLowerCase()}.toJson(): null,
""");
    return """

  ${comment}
  ${nameClass} get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is ${returnType} == false){
        return ${nameClass}({}); 
      }
      return ${nameClass}(rawData["${key}"] as ${returnType});
    } catch (e) {  
      return ${nameClass}({}); 
    }
  }


  ${comment}
  set ${nameMethod.toLowerCase()}(${nameClass} value) {
    rawData["${key}"] = value.toJson();
  }


""";
  }
  if (isList) {
    paramFunction.call("""
      List<${returnType}>? ${nameMethod.toLowerCase()},
""");
    paramJson.call("""
      "${key}": ${nameMethod.toLowerCase()},
""");
    return """

  ${comment}
  ///
  /// default:
  /// 
  /// 
  List<${returnType}> get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is List == false){
        return [];
      }
      return (rawData["${key}"] as List).cast<${returnType}>();
    } catch (e) {
      return [];
    }
  }


  ${comment}
  set ${nameMethod.toLowerCase()}(List<${returnType}> value) {
    rawData["${key}"] = value;
  }

""";
  }
  if (RegExp(r"^(special_)", caseSensitive: false).hashData(nameMethod)) {
    paramFunction.call("""
    ${returnType} ${nameMethod.toLowerCase()} = ${json.encode(value)},
""");
  } else {
    paramFunction.call("""
    ${returnType}? ${nameMethod.toLowerCase()},
""");
  }
  paramJson.call("""
      "${key}": ${nameMethod.toLowerCase()},
""");

  return """

  ${comment}
  ${returnType}? get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is ${returnType} == false){
        return null;
      }
      return rawData["${key}"] as ${returnType};
    } catch (e) {
      return null;
    }
  }

  ${comment}
  set ${nameMethod.toLowerCase()}(${returnType}? value) {
    rawData["${key}"] = value;
  }

""";
}

/// GeneralLib
String textToListFunction({
  required String key,
  required String returnType,
  required String className,
  bool isClass = false,
  bool isList = false,
  String? comment,
  required void Function(String text) paramFunction,
  required void Function(String text) paramJson,
}) {
  comment ??= "";
  String nameClass = className.camelCaseClass();

  String nameMethod = key.replaceAll(RegExp(r"^(@|[0-9]+)", caseSensitive: false), "special_").replaceAll(RegExp(r"([\-]+)", caseSensitive: false), "_").replaceAll(RegExp(r"^(_)", caseSensitive: false), "special_");
  if (RegExp(r"^(do|is|in)$", caseSensitive: false).hasMatch(nameMethod)) {
    nameMethod += "_";
  }
  if (isClass) {
    if (isList) {
      paramFunction.call("""
      List<List<${nameClass}>>? ${nameMethod.toLowerCase()},
""");
      paramJson.call("""
      "${key}": (${nameMethod.toLowerCase()} != null)? ${nameMethod.toLowerCase()}.map((res) => res.map((e) => e.toJson()).toList().cast<Map>()).toList().cast<List<Map>>(): null,
""");
      return """
  ${comment}
List<List<${nameClass}>> get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is List == false){
        return [];
      }
      return ((rawData["${key}"] as List).cast<List>()).map((e) => e.map((e) => ${nameClass}(e as Map)).toList().cast<${nameClass}>()).toList().cast<List<${nameClass}>>();
    } catch (e) {
      return [];
    }
  }

  ${comment}
  set ${nameMethod.toLowerCase()}(List<List<${nameClass}>> values) {
    rawData["${key}"] = values.map((value) => value.map((value) => value.toJson()).toList()).toList();
  }


""";
    }
    paramFunction.call("""
      ${nameClass}? ${nameMethod.toLowerCase()},
""");
    paramJson.call("""
      "${key}": (${nameMethod.toLowerCase()} != null)?${nameMethod.toLowerCase()}.toJson(): null,
""");
    return """

  ${comment}
  ${nameClass} get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is ${returnType} == false){
        return ${nameClass}({}); 
      }
      return ${nameClass}(rawData["${key}"] as ${returnType});
    } catch (e) {  
      return ${nameClass}({}); 
    }
  }

  ${comment}
  set ${nameMethod.toLowerCase()}(${nameClass} value) {
    rawData["${key}"] = value.toJson();
  }
""";
  }
  if (isList) {
    paramFunction.call("""
      List<List<${returnType}>>? ${nameMethod.toLowerCase()},
""");
    paramJson.call("""
      "${key}": ${nameMethod.toLowerCase()},
""");
    return """

  ${comment}
  List<List<${returnType}>> get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is List == false){
        return [];
      }
      return (rawData["${key}"] as List).cast<List<${returnType}>>();
    } catch (e) {
      return [];
    }
  }

  ${comment}
  set ${nameMethod.toLowerCase()}(List<List<${returnType}>> value) {
    rawData["${key}"] = value;
  }

""";
  }
  paramFunction.call("""
    ${returnType}? ${nameMethod.toLowerCase()},
""");
  paramJson.call("""
      "${key}": ${nameMethod.toLowerCase()},
""");

  return """

  ${comment}
  ${returnType}? get ${nameMethod.toLowerCase()} {
    try {
      if (rawData["${key}"] is ${returnType} == false){
        return null;
      }
      return rawData["${key}"] as ${returnType};
    } catch (e) {
      return null;
    }
  }


  ${comment}
  set ${nameMethod.toLowerCase()}(${returnType}? value) {
    rawData["${key}"] = value;
  }

""";
}
