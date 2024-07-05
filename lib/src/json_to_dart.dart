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
// /* <!-- START LICENSE -->

// Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION
// Social Media:

// - Youtube: https://youtube.com/@Global_Corporation
// - Github: https://github.com/globalcorporation
// - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

// Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

// Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

// Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

// Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

// <!-- END LICENSE --> */
// // ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names
// //

// import 'dart:convert';
// import 'package:general_lib/general_lib.dart';

// JsonDataScript jsonToDart(
//   Map<String, dynamic> data, {
//   String className = "Root",
//   bool isMain = true,
//   bool isUseClassName = false,
//   String? comment,
//   bool isStatic = true,
// }) {
//   if (isStatic) {
//     return JsonDataScript(
//       className: className,
//       datas: [
//         jsonToDartStatic(
//           data,
//           className: className,
//           isMain: isMain,
//           isUseClassName: isUseClassName,
//           comment: comment,
//         ),
//       ],
//     );
//   } else {
//     return JsonDataScript(
//       className: className,
//       datas: [
//         jsonToDartDynamic(
//           data,
//           className: className,
//           isMain: isMain,
//           isUseClassName: isUseClassName,
//           comment: comment,
//         ),
//       ],
//     );
//   }
// }

// String jsonToDartDynamic(
//   Map<String, dynamic> data, {
//   String className = "Root",
//   bool isMain = true,
//   bool isUseClassName = false,
//   String? comment,
// }) {
//   comment ??= "";
//   List<String> classMessages = [];
//   String classMessage = """
// ${((isMain) ? "// ignore_for_file: non_constant_identifier_names\nimport 'dart:convert';" : "")}

// ${comment}
// class ${className} {
//   Map rawData;

// """;
//   String classData = """

//   ${comment}
//   ${className}(this.rawData) {

// """;
//   String classDataCreate = """

//   ${comment}
//   factory ${className}.create({

// """;
//   String classDataCreateJson = """{

// """;
//   data.forEach((key, value) {
//     String nameClass = key.camelCaseClass();
//     if (isUseClassName) {
//       nameClass = "${className}${key.camelCaseClass()}";
//     }

//     if (value is String) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "String",
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is int) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "int",
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     } else if (value is double) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "double",
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     } else if (value is num) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "num",
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is bool) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "bool",
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is Map) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "Map",
//         isClass: true,
//         isUseClassName: isUseClassName,
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//       classMessages.add(jsonToDartDynamic(value.cast<String, dynamic>(),
//           className: nameClass,
//           isMain: false,
//           isUseClassName: isUseClassName,
//           comment: comment));
//     }

//     if (value is List) {
//       if (value.isNotEmpty) {
//         if (value.first is Map) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "Map",
//             isClass: true,
//             isUseClassName: isUseClassName,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//           classMessages.add(jsonToDartDynamic(
//               (value.first as Map).cast<String, dynamic>(),
//               className: nameClass,
//               isMain: false,
//               isUseClassName: isUseClassName,
//               comment: comment));
//         }
//         if (value.first is bool) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "bool",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first is String) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "String",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first is int) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "int",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         } else if (value.first is double) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "double",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         } else if (value.first is num) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "num",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first == null) {
//           classMessage += textToFunctionDynamic(
//             key: key,
//             className: className,
//             returnType: "Object",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             callback: (text) {
//               classData += text;
//             },
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//       } else {
//         classMessage += textToFunctionDynamic(
//           key: key,
//           className: className,
//           returnType: "Object",
//           isClass: false,
//           isList: true,
//           comment: comment,
//           callback: (text) {
//             classData += text;
//           },
//           paramFunction: (text) {
//             classDataCreate += text;
//           },
//           paramJson: (text) {
//             classDataCreateJson += text;
//           },
//         );
//       }
//     }

//     if (value == null) {
//       classMessage += textToFunctionDynamic(
//         key: key,
//         className: className,
//         returnType: "Object",
//         isClass: false,
//         isList: false,
//         comment: comment,
//         callback: (text) {
//           classData += text;
//         },
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//   });
//   classDataCreateJson += "\n\n  }";
//   classDataCreate += "})  {";
//   classDataCreate += "\n\nreturn ${className}(${classDataCreateJson});";

//   classDataCreate += "\n\n      }";
//   classData += "\n\n    }";

//   classMessage += classData;

//   classMessage += classDataCreate;

//   classMessage += """

//   /// operator map data
//    operator [](key) {
//     return rawData[key];
//   }

//   /// operator map data
//   void operator []=(key, value) {
//     rawData[key] = value;
//   }

//   /// return original data json
//   Map toMap() {
//     return rawData;
//   }

//   /// return original data json
//   Map toJson() {
//     return rawData;return
//   }

//   /// return string data encode json original data
//   @override
//   String toString() {
//     return json.encode(rawData);
//   }
// }""";

//   classMessage += "\n\n${classMessages.join("\n\n")}";
//   return classMessage;
// }

// String jsonToDartStatic(
//   Map<String, dynamic> data, {
//   String className = "Root",
//   bool isMain = true,
//   bool isUseClassName = false,
//   String? comment,
// }) {
//   comment ??= "";
//   List<String> classMessages = [];
//   String classMessage = """
// ${((isMain) ? "// ignore_for_file: non_constant_identifier_names\nimport 'dart:convert';" : "")}

// ${comment}
// class ${className} {
//   Map rawData;

//   ${comment}
//   ${className}(this.rawData);

//   static Map get defaultData {
//     return ${json.encode(data)};
//   }
// """;

//   String classDataCreate = """

//   ${comment}
//   static ${className} create({

// """;
//   String classDataCreateJson = """
//     Map jsonData = ${className}.defaultData;
//     Map jsonCreate = {

// """;
//   data.forEach((key, value) {
//     String nameClass = key.camelCaseClass();
//     if (isUseClassName) {
//       nameClass = "${className}${key.camelCaseClass()}";
//     }

//     if (value is String) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "String",
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is int) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "int",
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     } else if (value is double) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "double",
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     } else if (value is num) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "num",
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is bool) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "bool",
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//     if (value is Map) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "Map",
//         isClass: true,
//         isUseClassName: isUseClassName,
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//       classMessages.add(
//         jsonToDart(
//           value.cast<String, dynamic>(),
//           className: nameClass,
//           isMain: false,
//           isUseClassName: isUseClassName,
//           comment: comment,
//         ).first,
//       );
//     }

//     if (value is List) {
//       if (value.isNotEmpty) {
//         if (value.first is Map) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "Map",
//             isClass: true,
//             isUseClassName: isUseClassName,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//           classMessages.add(jsonToDart(
//                   (value.first as Map).cast<String, dynamic>(),
//                   className: nameClass,
//                   isMain: false,
//                   isUseClassName: isUseClassName,
//                   comment: comment)
//               .first);
//         }
//         if (value.first is bool) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "bool",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first is String) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "String",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first is int) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "int",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         } else if (value.first is double) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "double",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         } else if (value.first is num) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "num",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//         if (value.first == null) {
//           classMessage += textToFunction(
//             key: key,
//             className: className,
//             returnType: "Object",
//             isClass: false,
//             isList: true,
//             comment: comment,
//             paramFunction: (text) {
//               classDataCreate += text;
//             },
//             paramJson: (text) {
//               classDataCreateJson += text;
//             },
//           );
//         }
//       } else {
//         classMessage += textToFunction(
//           key: key,
//           className: className,
//           returnType: "Object",
//           isClass: false,
//           isList: true,
//           comment: comment,
//           paramFunction: (text) {
//             classDataCreate += text;
//           },
//           paramJson: (text) {
//             classDataCreateJson += text;
//           },
//         );
//       }
//     }

//     if (value == null) {
//       classMessage += textToFunction(
//         key: key,
//         className: className,
//         returnType: "Object",
//         isClass: false,
//         isList: false,
//         comment: comment,
//         paramFunction: (text) {
//           classDataCreate += text;
//         },
//         paramJson: (text) {
//           classDataCreateJson += text;
//         },
//       );
//     }
//   });

//   classDataCreateJson += "\n\n  };";
//   classDataCreate += "})  {";
//   classDataCreate += """
// ${classDataCreateJson}

//     jsonCreate.forEach((key, value) {
//       try {
//         if (value != null) {
//           jsonData[key] = value;
//         }
//       } catch (e, stack) {
//         print("${className} \${e.toString()}, \${stack.toString()}");
//       }
//     });
// return ${className}(jsonData);""";

//   classDataCreate += "\n\n      }";

//   classMessage += classDataCreate;

//   classMessage += """

//   /// operator map data
//    operator [](key) {
//     return rawData[key];
//   }

//   /// operator map data
//   void operator []=(key, value) {
//     rawData[key] = value;
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
//   @override
//   String toString() {
//     return json.encode(rawData);
//   }
// }""";

//   classMessage += "\n\n${classMessages.join("\n\n")}";
//   return classMessage;
// }

// String textToFunction({
//   required String key,
//   required String returnType,
//   required String className,
//   bool isClass = false,
//   bool isList = false,
//   bool isUseClassName = false,
//   String? comment,
//   required void Function(String text) paramFunction,
//   required void Function(String text) paramJson,
// }) {
//   comment ??= "";
//   String nameClass = key.camelCaseClass();
//   if (isUseClassName) {
//     nameClass = "${className}${key.camelCaseClass()}";
//   }

//   String nameMethod = key
//       .replaceAll(RegExp(r"^(@|[0-9]+)", caseSensitive: false), "special_")
//       .replaceAll(RegExp(r"([\-]+)", caseSensitive: false), "_")
//       .replaceAll(RegExp(r"^(_)", caseSensitive: false), "special_");
//   if (RegExp(r"^(do|is|in)$", caseSensitive: false).hasMatch(nameMethod)) {
//     nameMethod += "_";
//   }
//   if (isClass) {
//     if (isList) {
//       paramFunction.call("""
//       List<${nameClass}?>? ${nameMethod},
// """);
//       paramJson.call("""
//       "${key}": (${nameMethod} != null)? ${nameMethod}.map((res) => res!.toJson()).toList().cast<Map>(): null,
// """);
//       return """
//   ${comment}
//   List<${nameClass}> get ${nameMethod} {
//     try {
//       if (rawData["$key"] is List == false){
//         return [];
//       }
//       return (rawData["$key"] as List).map((e) => ${nameClass}(e as $returnType)).toList().cast<${nameClass}>();
//     } catch (e) {
//       return [];
//     }
//   }

// """;
//     }
//     paramFunction.call("""
//       ${nameClass}? ${nameMethod},
// """);
//     paramJson.call("""
//       "${key}": (${nameMethod} != null)?${nameMethod}.toJson(): null,
// """);
//     return """

//   ${comment}
//   ${nameClass} get ${nameMethod} {
//     try {
//       if (rawData["$key"] is $returnType == false){
//         return ${nameClass}({});
//       }
//       return ${nameClass}(rawData["$key"] as $returnType);
//     } catch (e) {
//       return ${nameClass}({});
//     }
//   }

// """;
//   }
//   if (isList) {
//     paramFunction.call("""
//       List<${returnType}?>? ${nameMethod},
// """);
//     paramJson.call("""
//       "${key}": ${nameMethod},
// """);
//     return """

//   ${comment}
//   List<${returnType}> get ${nameMethod} {
//     try {
//       if (rawData["$key"] is List == false){
//         return [];
//       }
//       return (rawData["$key"] as List).cast<${returnType}>();
//     } catch (e) {
//       return [];
//     }
//   }

// """;
//   }
//   paramFunction.call("""
//     $returnType? ${nameMethod},
// """);
//   paramJson.call("""
//       "${key}": ${nameMethod},
// """);

//   return """

//   ${comment}
//   $returnType? get ${nameMethod} {
//     try {
//       if (rawData["$key"] is $returnType == false){
//         return null;
//       }
//       return rawData["$key"] as $returnType;
//     } catch (e) {
//       return null;
//     }
//   }

// """;
// }

// String textToFunctionDynamic({
//   required String key,
//   required String returnType,
//   required String className,
//   bool isClass = false,
//   bool isList = false,
//   bool isUseClassName = false,
//   String? comment,
//   required void Function(String text) callback,
//   required void Function(String text) paramFunction,
//   required void Function(String text) paramJson,
// }) {
//   comment ??= "";
//   String nameClass = key.camelCaseClass();
//   if (isUseClassName) {
//     nameClass = "${className}${key.camelCaseClass()}";
//   }

//   String nameMethod = key
//       .replaceAll(RegExp(r"^(@|[0-9]+)", caseSensitive: false), "special_")
//       .replaceAll(RegExp(r"([\-]+)", caseSensitive: false), "_")
//       .replaceAll(RegExp(r"^(_)", caseSensitive: false), "special_");
//   if (RegExp(r"^(do|is|in)$", caseSensitive: false).hasMatch(nameMethod)) {
//     nameMethod += "_";
//   }

//   if (isClass) {
//     if (isList) {
//       paramFunction.call("""
//       List<${nameClass}?>? ${nameMethod},
// """);
//       paramJson.call("""
//       "${key}": (${nameMethod} != null)? ${nameMethod}.map((res) => res!.toJson()).toList().cast<Map>(): null,
// """);
//       callback.call("""
//       try {
//         if (rawData["$key"] is List == false){
//           ${nameMethod}  = null;
//         }
//         ${nameMethod} = (rawData["$key"] as List).map((e) => ${nameClass}(e as $returnType)).toList().cast<${nameClass}>();
//       } catch (e) {
//         ${nameMethod}  = null;
//       }
// """);
//       return """
//   ${comment}
//   List<${nameClass}?>? ${nameMethod};

// """;
//     }
//     paramFunction.call("""
//       ${nameClass}? ${nameMethod},
// """);
//     paramJson.call("""
//       "${key}": (${nameMethod} != null)?${nameMethod}.toJson(): null,
// """);
//     callback.call("""
//       try {
//         if (rawData["$key"] is $returnType == false){
//           ${nameMethod}  =  ${nameClass}({});
//         }
//         ${nameMethod} = ${nameClass}(rawData["$key"] as $returnType);
//       } catch (e) {
//         ${nameMethod}  = ${nameClass}({});
//       }
// """);
//     return """

//   ${comment}
//   ${nameClass} ${nameMethod} = ${nameClass}({});

// """;
//   }
//   if (isList) {
//     paramFunction.call("""
//       List<${returnType}?>? ${nameMethod},
// """);
//     paramJson.call("""
//       "${key}": ${nameMethod},
// """);
//     callback.call("""
//       try {
//         if (rawData["$key"] is List == false){
//           ${nameMethod}  = null;
//         }
//         ${nameMethod} = (rawData["$key"] as List).cast<${returnType}>();
//       } catch (e) {
//         ${nameMethod}  = null;
//       }
// """);
//     return """

//   ${comment}
//   List<${returnType}?>? ${nameMethod};

// """;
//   }
//   paramFunction.call("""
//     $returnType? ${nameMethod},
// """);
//   paramJson.call("""
//       "${key}": ${nameMethod},
// """);
//   callback.call("""
//       try {
//         if (rawData["$key"] is $returnType == false){
//           ${nameMethod}  = null;
//         }
//         ${nameMethod} = rawData["$key"] as $returnType;
//       } catch (e) {
//         ${nameMethod}  = null;
//       }
// """);
//   return """

//   ${comment}
//   $returnType? ${nameMethod};

// """;
// }
