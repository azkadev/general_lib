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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, empty_catches

import 'dart:convert';

import 'package:general_lib/extension/string.dart';

import 'package:general_lib/language/language_data.dart';
import 'package:general_lib/schemes/language_code.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

Future<Directory> jsonToLanguageScript({
  required Map language_raw,
  required String default_language_code_id,
  required Directory directory,
  required Future<String?> Function(String origin_data, String language_code_id,
          String default_language_code_id)
      onData,
  bool is_translate = true,
}) async {
  if (!directory.existsSync()) {
    await directory.create(recursive: true);
  }

  final String base_name = path.basename(directory.path);

  final List<Map> langugage_data = [];
  final String language_parameter =
      "${base_name.camelCaseClass()}CodeData".toLowerCaseFirstData();

  for (var element in language_raw.entries) {
    final String key = element.key;
    if (element.value is Map == false) {
      continue;
    }
    final Map value = element.value;
    if (value["is_skip"] == true) {
      continue;
    }
    value.remove("is_skip");

    final String name_extension =
        "${key.toString().camelCaseClass()}Extension${base_name.camelCaseClass()}";
    String script = """
// ignore_for_file: non_constant_identifier_names

// import "${base_name}_core.dart";
// import "${base_name}_code_data.dart";
import "package:general_lib/scheme/language_code_data.dart";
import "package:general_lib/language/language_core.dart";
import "package:general_lib/regexp_replace/regexp_replace.dart";

// extension ${name_extension} on ${base_name.camelCaseClass()} {
extension ${name_extension} on Language {

""";
    final String script_method = await languageMapToStringScript(
      key_name: key,
      data: value,
      language_parameter: language_parameter,
      default_language_code_id: default_language_code_id,
      is_translate: is_translate,
      base_name: base_name,
      onData: onData,
    );

    script += "\n${script_method}\n";

    script += "\n}";
    final Map jsonData = {
      "name": key,
      "script": script,
    };

    langugage_data.add(jsonData);
  }
  langugage_data.add({
    "name": "${base_name}_scheme",
    "script": langugage_data
        .map((e) => "export ${json.encode("${e["name"]}.dart")};")
        .toSet()
        .toList()
        .join("\n"),
  });

//   langugage_data.add({
//     "name": "${base_name}_core",
//     "script": """
// // ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_brace_in_string_interps
// //
// import '${base_name}_code_data.dart';

// class ${base_name.camelCaseClass()} {
//   String language_code = "id";

//   List<Map<String, String>> replace_data = [];
//   ${base_name.camelCaseClass()}({
//     String languageCode = "id",
//     required List<Map<String, String>> replaceData,
//   }) {
//     language_code = languageCode;
//     replace_data = replaceData;
//   }

//   String sendLanguage({
//     required ${base_name.camelCaseClass()}CodeData ${language_parameter},
//     required String id,
//     List<RegExpReplace>? regexpReplaces,
//     String? languageCode,
//   }) {
//     languageCode ??= language_code;
//     replacesDatas ??= replace_data;
//     try {
//       String language_result = ${language_parameter}[languageCode] ?? ${language_parameter}["id"] ?? "Translation not found\\n\\n\${id}: Tidak ada bahasa \${languageCode}";
//       if (language_result.isEmpty) {
//         language_result = "Translation not found\\n\\n\${id}: Tidak ada bahasa \${languageCode}";
//       }

//       return variableMessage(
//         text: language_result,
//         regexpReplaces: regexpReplaces,
//       );
//     } catch (e) {
//       return "LanguageBot error\\nId: \${id}\\nRes: \${e.toString()}";
//     }
//   }

//   String variableMessage({
//     required String text,
//     List<RegExpReplace>? regexpReplaces,
//   }) {
//     replacesDatas ??= replace_data;
//     try {
//       String message = "";
//       message = text;
//       List<Map<String, String>> replaceData = [...replacesDatas];
//       for (var i = 0; i < replaceData.length; i++) {
//         Map loopData = replaceData[i];
//         if (loopData["origin"] != null && loopData["replace"] != null) {
//           try {
//             message = message.replaceAll(RegExp(loopData["origin"] ?? "", caseSensitive: false), loopData["replace"] ?? "");
//           } catch (e) {}
//         }
//       }

//       return message;
//     } catch (e) {
//       return text;
//     }
//   }
// }

// """,
//   });

  // print(langugage_data);
  for (var i = 0; i < langugage_data.length; i++) {
    final Map language_data_raw = langugage_data[i];

    final File file =
        File(path.join(directory.path, "${language_data_raw["name"]}.dart"));
    await file.writeAsString(language_data_raw["script"]);
  }

  final Map language_code_json = {
    ...languageCodeJson,
  };

  language_code_json["@type"] = "${base_name.camelCaseClass()}CodeData";
  // await jsonToScripts(
  //   [language_code_json],
  //   directory: directory,
  //   path_package_json_dart: "import \"package:general_lib/json_scheme/json_scheme.dart\";",
  // );

  final File file = File(path.join(directory.path, "${base_name}.dart"));

  if (file.existsSync()) {
    String contents = """

// export ${json.encode("${base_name}_core.dart")};
export ${json.encode("${base_name}_scheme.dart")};

""";
    await file.writeAsString(contents, mode: FileMode.writeOnlyAppend);
  }

  return directory;
}

Future<String> languageMapToStringScript({
  required String key_name,
  required Map data,
  required String language_parameter,
  bool is_translate = true,
  required String default_language_code_id,
  required String base_name,
  required Future<String?> Function(String origin_data, String language_code_id,
          String default_language_code_id)
      onData,
}) async {
  String script = "";

  for (var element in data.entries) {
    final String key = element.key;

    if (element.value is String) {
      final String value = element.value;

      String script_new = "";
      final Map language_raw_data = {
        default_language_code_id: value,
      };

      if (is_translate) {
        for (var i = 0; i < languageCodeNames.length; i++) {
          final String language_code_new = languageCodeNames[i];
          if (language_raw_data.containsKey(language_code_new)) {
            continue;
          }
          try {
            final String? result_translate = await onData(
                value, language_code_new, default_language_code_id);
            if (result_translate != value && result_translate != null) {
              if (result_translate.isEmpty) {
                continue;
              }
              language_raw_data[language_code_new] = result_translate;
            }
          } catch (e) {}
        }
      }
      script_new += "\n";
      script_new += """
    /// default return
    /// ```dart
    /// \"\"\"
    ${value.toString().split("\n").map((e) => "    /// ${e}").join("\n").trim()}
    /// \"\"\";
    /// ```
    String ${key_name}_${key}({
      String? languageCode,
      List<RegExpReplace>? regexpReplaces,
    }) {
      final Map language_raw_data = ${json.encode(language_raw_data)};

      return sendLanguage( 
        // ${language_parameter}: ${base_name.camelCaseClass()}CodeData(        
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: ${json.encode("${key_name}_${key}")},
        regexpReplaces: regexpReplaces,
        languageCode: languageCode,
      );
     
    }""";

      script += script_new;
    }

    if (element.value is Map) {
      final Map value = element.value;

      String script_new = "";
      final Map language_raw_data = {
        default_language_code_id: value[default_language_code_id],
      };
      for (var element in value.entries) {
        if (element.key is String && element.value is String) {
          if (language_raw_data.containsKey(element.key)) {
            continue;
          }
          if (languageCodeNames.contains(element.key)) {
            if (element.value.toString().isNotEmpty) {
              language_raw_data[element.key] = element.value;
            }
          }
        }
      }

      if (is_translate) {
        for (var i = 0; i < languageCodeNames.length; i++) {
          final String language_code_new = languageCodeNames[i];
          if (language_raw_data.containsKey(language_code_new)) {
            continue;
          }
          try {
            final String? result_translate = await onData(
                value[default_language_code_id],
                language_code_new,
                default_language_code_id);
            if (result_translate != value[default_language_code_id] &&
                result_translate != null) {
              if (result_translate.isEmpty) {
                continue;
              }
              language_raw_data[language_code_new] = result_translate;
            }
          } catch (e) {}
        }
      }

      script_new += "\n";

      script_new += """
    /// default return
    /// ```dart
    /// \"\"\"
    ${value[default_language_code_id].toString().split("\n").map((e) => "    /// ${e}").join("\n").trim()}
    /// \"\"\";
    /// ```
    String ${key_name}_${key}({
      String? languageCode,
      List<RegExpReplace>? regexpReplaces,
    }) {
      final Map language_raw_data = ${json.encode(language_raw_data)};

      return sendLanguage(
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: ${json.encode("${key_name}_${key}")},
        regexpReplaces: regexpReplaces,
        languageCode: languageCode,
      );
     
    }""";

      script += script_new;
    }
  }
  return script;
}
