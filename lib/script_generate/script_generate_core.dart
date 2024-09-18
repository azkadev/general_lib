// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

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
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:general_lib/extension/regexp.dart';
import 'package:general_lib/extension/string.dart';
import 'package:general_lib/regexp_replace/regexp_replace.dart';
import 'package:universal_io/io.dart';

import "package:path/path.dart" as path;

class ScriptGeneratorStatus {
  FileSystemEntity file_system_entity;

  String text;
  ScriptGeneratorStatus({
    required this.file_system_entity,
    required this.text,
  });
  @override
  String toString() {
    return "${text} ${path.basename(file_system_entity.path)}";
  }
}

/// slebew
class ScriptGenerator {
  FileSystemEntity file_system_entity;
  Map state_data = {};
  Directory directory_base;
  String value;
  FileSystemEntityType file_system_entity_type;
  List<ScriptGenerator> children;
  bool is_generate;

  /// slebew
  ScriptGenerator({
    required this.is_generate,
    required this.directory_base,
    required this.file_system_entity,
    required this.state_data,
    required this.file_system_entity_type,
    required this.value,
    required this.children,
  });

  static String replacerData({
    required String value,
    required String originProjectName,
    required String newProjectName,
    required bool isSkipAutoRename,
    required bool is_file,
    required String name,
  }) {
    if (isSkipAutoRename) {
      return value;
    }
    value = value.replaceAll(originProjectName, newProjectName);
    if (is_file) {
      return value;
    }
    final List<RegExpReplace> regExpReplaces = [
      // example:
      // SlebewProject
      // NewProject
      RegExpReplace(
        from: RegExp(originProjectName.camelCaseClass()),
        replace: (match) {
          return newProjectName.camelCaseClass();
        },
      ),
      // example:
      // slebewProject
      // newProject
      RegExpReplace(
        from: RegExp(originProjectName.camelCaseClass().toLowerCaseFirstData()),
        replace: (match) {
          return newProjectName.camelCaseClass().toLowerCaseFirstData();
        },
      ),
      // example:
      // Slebew Project
      // New Project
      RegExpReplace(
        from: RegExp(originProjectName.snakeCaseClass().split("_").join(" "), caseSensitive: false),
        replace: (match) {
          return newProjectName.snakeCaseClass().split("_").map((e) => e.toUpperCaseFirstData()).join(" ");
        },
      ),
    ];
    if (originProjectName.snakeCaseClass().split("_").length <= 1) {
      regExpReplaces.removeLast();
    }
    if (RegExp(r"^(pubspec[.]yaml)$", caseSensitive: false).hashData(name)) {
      regExpReplaces.removeLast();
    }
    for (var i = 0; i < regExpReplaces.length; i++) {
      RegExpReplace regExpReplace = regExpReplaces[i];
      value = value.replaceAllMapped(regExpReplace.from, regExpReplace.replace);
    }
    return value;
  }

  String getPath() {
    return path.relative(file_system_entity.uri.toFilePath(), from: directory_base.uri.toFilePath());
  }

  Map toJson() {
    return {
      "@type": "ScriptGenerator",
      "is_generate": true,
      "directory_base": (path.basename(directory_base.uri.toFilePath())),
      "file_system_entity": path.relative(file_system_entity.uri.toFilePath(), from: directory_base.uri.toFilePath()),
      "file_system_entity_type": file_system_entity_type.toString(),
      "value": value,
      "children": children.map((e) => e.toJson()).toList(growable: true),
    };
  }

  String valueToScript() {
    String parse_value = value;
    for (final RegExpReplace regExpReplace in regExpReplaces()) {
      parse_value = parse_value.replaceAllMapped(regExpReplace.from, regExpReplace.replace);
    }

    if (parse_value.isEmpty) {
      return "${json.encode("")}";
    }
    if (is_file_dart) {
      // return "${json.encode(json.encode(parse_value))}";
    }
    return "r\"\"\"\n${parse_value}\n\"\"\"";
  }

  bool get is_file_dart => (path.extension(file_system_entity.path) == ".dart");

  List<RegExpReplace> regExpReplaces() {
    bool is_file_dart_procces = is_file_dart;
    return [
      RegExpReplace(
        from: RegExp(r"((.)?(\$))"),
        replace: (match) {
          final String gro = match.group(2) ?? "";
          final String gall = match.group(1) ?? "";
          // if (gro != "\\") {
          //   return "\\${gall}";
          // }
          return "${gall}";
        },
      ),
      if (is_file_dart_procces) ...[ 
        RegExpReplace(
          from: RegExp(r'((\\)?\"(\\)?\"(\\)?\")'),
          replace: (match) {
            final String all = match.group(1) ?? "";
            final String actually = "'''"; 
            if (all != actually) {
              return actually;
            }
            return all;
          },
        ),
      ],
    ];
  }

  String toScriptDart() {
    String script_generate = """
ScriptGenerator(
  is_generate: true,
  directory_base: Directory(${json.encode(path.basename(directory_base.uri.toFilePath()))}),
  file_system_entity: ${() {
      String base_file_path = path.relative(file_system_entity.uri.toFilePath(), from: directory_base.uri.toFilePath());
      if (file_system_entity_type == FileSystemEntityType.file) {
        return "File(${json.encode(base_file_path)})";
      }
      return "Directory(${json.encode(base_file_path)})";
    }()},
  state_data: {},
  file_system_entity_type: FileSystemEntityType.${file_system_entity_type.toString()},
  value: ${valueToScript()},
  children: [
    ${children.map((e) => e.toScriptDart()).join(",\n    ")}
  ],
)
""";
    // RegExp.escape(text);

    return script_generate.trim();
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
