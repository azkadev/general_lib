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
// ignore_for_file: non_constant_identifier_names, unnecessary_this, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib/script_generate/script_generate_core.dart';
import 'package:general_lib/script_generate/script_generate_options.dart';
import 'package:io_universe/io_universe.dart';

import "package:path/path.dart" as path;

/// GeneralLib
typedef OnWrittingScriptGenerator = FutureOr<String> Function(
    ScriptGenerator scriptGenerator, File file);

/// GeneralLib
extension ScriptGeneratorGeneralLibExtensionListFileSystemEntity
    on List<FileSystemEntity> {
  /// GeneralLib
  List<ScriptGenerator> toScriptGenerate({
    Directory? directoryBase,
    required ScriptGeneratorOptions scriptGeneratorOptions,
  }) {
    final List<ScriptGenerator> sles = [];
    local_sort();
    final FileSystemEntity? fileSystemEntity_base = firstWhereOrNull((element) {
      if (element is Directory) {
        return true;
      }
      return false;
    });

    final Directory directory = () {
      if (directoryBase != null) {
        return directoryBase;
      }
      if (fileSystemEntity_base != null) {
        return fileSystemEntity_base.parent;
      }
      return Directory.current;
    }();

    final List<String> file_system_entity_ignores =
        scriptGeneratorOptions.fileSystemEntityIgnore.toGlob();

    for (final element in FileSystemEntityIgnore.getFileIgnoresByDirectory(
        currentPath: directory.uri.toFilePath())) {
      if (file_system_entity_ignores.contains(element) == false) {
        file_system_entity_ignores.add(element);
      }
    }
    final List<RegExp> file_system_entity_ignores_regexp =
        file_system_entity_ignores.map((e) => RegExp(e)).toList();

    for (var i = 0; i < length; i++) {
      final FileSystemEntity fileSystemEntity = this[i];
      if (file_system_entity_ignores_regexp
          .globContains(fileSystemEntity.path)) {
        continue;
      }
      if (fileSystemEntity is File) {
        final String base_name =
            path.basename(fileSystemEntity.uri.toFilePath());
        if (["pubspec.lock"].contains(base_name.toLowerCase().trim())) {
          if (scriptGeneratorOptions.isVerbose) {
            print(
                "SKIP ON FILE: ${fileSystemEntity.statSync().type} ${path.relative(fileSystemEntity.uri.toFilePath(), from: directory.path)}");
          }
          continue;
        }
        final List<String> paths_folders =
            path.split(fileSystemEntity.uri.toFilePath());
        if (paths_folders.contains(".dart_tool")) {
          if (scriptGeneratorOptions.isVerbose) {
            print(
                "SKIP ON FILE: ${fileSystemEntity.statSync().type} ${path.relative(fileSystemEntity.uri.toFilePath(), from: directory.path)}");
          }
          continue;
        }

        final File file = File(fileSystemEntity.uri.toFilePath());
        String data = "";
        try {
          data = file.readAsStringSync();
        } catch (e) {
          continue;
        }
        sles.add(ScriptGenerator(
          is_generate: false,
          directory_base: directory,
          file_system_entity: fileSystemEntity,
          state_data: {},
          value: data,
          file_system_entity_type: fileSystemEntity.statSync().type,
          children: [],
        ));
      } else if (fileSystemEntity is Directory) {
        final String base_name =
            path.basename(fileSystemEntity.uri.toFilePath());
        final List<String> paths_folders =
            path.split(fileSystemEntity.uri.toFilePath());
        if (RegExp(r"^([.])", caseSensitive: false).hasMatch(base_name)) {
          if ([".github", ".idea"].contains(base_name) == false) {
            continue;
          }
        }
        if (paths_folders.contains(".dart_tool")) {
          if (scriptGeneratorOptions.isVerbose) {
            print(
                "SKIP ON DIR: ${fileSystemEntity.statSync().type} ${path.relative(fileSystemEntity.uri.toFilePath(), from: directory.path)}");
          }
          continue;
        }
        sles.add(ScriptGenerator(
          is_generate: false,
          directory_base: directory,
          file_system_entity: fileSystemEntity,
          state_data: {},
          value: "",
          file_system_entity_type: fileSystemEntity.statSync().type,
          children: fileSystemEntity.listSync().toScriptGenerate(
                directoryBase: directory,
                scriptGeneratorOptions: scriptGeneratorOptions.copyWith(
                  fileSystemEntityIgnore: file_system_entity_ignores.join("\n"),
                ),
              ),
        ));
      } else {
        final String base_name =
            path.basename(fileSystemEntity.uri.toFilePath());
        if (RegExp(r"^([.])", caseSensitive: false).hasMatch(base_name)) {
          continue;
        }
        sles.add(ScriptGenerator(
          is_generate: false,
          directory_base: directory,
          file_system_entity: fileSystemEntity,
          state_data: {},
          value: "",
          file_system_entity_type: fileSystemEntity.statSync().type,
          children: [],
        ));
      }
    }
    return sles;
  }
}

/// GeneralLib
extension ListScriptGeneratorExtensionGeneralLib on List<ScriptGenerator> {
  ///
  Stream<ScriptGeneratorStatus> generateToDirectory({
    required Directory directoryBase,
    OnWrittingScriptGenerator? onWritting,
    bool isSkipAutoRename = false,
  }) async* {
    // String base_path = directoryNew.uri.toFilePath();
    /// parse directory, jika tidak
    /// misal data path_slebew/.
    /// akhiran titik
    /// akan di baca base name jadi titik
    final Directory directory_base = Directory(directoryBase.uri.toFilePath());

    /// mendapatkan nama folder

    final String base_name = path.basename(directory_base.path);
    if (directory_base.existsSync() == false) {
      await directory_base.create(
        recursive: true,
      );
    }

    /// loop
    for (final ScriptGenerator scriptGenerator in this) {
      ///
      if (scriptGenerator.file_system_entity_type ==
          FileSystemEntityType.file) {
        /// parse_path
        final String path_origin_file = () {
          if ((path
                  .basename(scriptGenerator.directory_base.uri.toFilePath())
                  .toLowerCase() ==
              path
                  .basenameWithoutExtension(
                      scriptGenerator.file_system_entity.uri.toFilePath())
                  .toLowerCase())) {
            String result_path = "";
            if (scriptGenerator.is_generate) {
              result_path = scriptGenerator.file_system_entity.uri.toFilePath();
            } else {
              result_path = path.relative(
                scriptGenerator.file_system_entity.uri.toFilePath(),
                from: scriptGenerator.directory_base.uri.toFilePath(),
              );
            }
            // change name origin if same to new file name
            // return result_path.replaceAll(path.basename(scriptGenerator.directory_base.uri.toFilePath()), base_name);
            return ScriptGenerator.replacerData(
              value: result_path,
              originProjectName: path
                  .basename(scriptGenerator.directory_base.uri.toFilePath()),
              newProjectName: base_name,
              isSkipAutoRename: isSkipAutoRename,
              name: path.basename(result_path),
              is_file: true,
            );
          } else {
            String result_path = "";
            if (scriptGenerator.is_generate) {
              result_path = scriptGenerator.file_system_entity.uri.toFilePath();
            } else {
              result_path = path.relative(
                scriptGenerator.file_system_entity.uri.toFilePath(),
                from: scriptGenerator.directory_base.uri.toFilePath(),
              );
            }
            // change name origin if same to new file name
            // old work
            // return result_path.replaceAll(path.basename(scriptGenerator.directory_base.uri.toFilePath()), base_name);
            return ScriptGenerator.replacerData(
              value: result_path,
              originProjectName: path
                  .basename(scriptGenerator.directory_base.uri.toFilePath()),
              newProjectName: base_name,
              isSkipAutoRename: isSkipAutoRename,
              name: path.basename(result_path),
              is_file: true,
            );
          }
        }();
        // end parse

        final File file =
            File(path.join(directory_base.uri.toFilePath(), path_origin_file));
        yield ScriptGeneratorStatus(
          file_system_entity: file,
          text: "Check Parent Directory",
        );

        if (file.parent.existsSync() == false) {
          file.parent.createSync(recursive: true);
        } else {
          yield ScriptGeneratorStatus(
            file_system_entity: file,
            text: "Parent Exist",
          );
        }
        final OnWrittingScriptGenerator? onWrittingScriptGenerator_script =
            onWritting;
        if (onWrittingScriptGenerator_script != null) {
          await file.writeAsString(
              (await onWrittingScriptGenerator_script(scriptGenerator, file)));
        } else {
          // await file.writeAsString(scriptGenerator.value.replaceAll(path.basename(scriptGenerator.directory_base.uri.toFilePath()), base_name));
          await file.writeAsString(
            ScriptGenerator.replacerData(
              value: scriptGenerator.value,
              originProjectName: path
                  .basename(scriptGenerator.directory_base.uri.toFilePath()),
              newProjectName: base_name,
              isSkipAutoRename: isSkipAutoRename,
              name: path.basename(file.path),
              is_file: false,
            ),
          );
        }
      } else if (scriptGenerator.file_system_entity_type ==
          FileSystemEntityType.directory) {
        yield ScriptGeneratorStatus(
          file_system_entity: scriptGenerator.file_system_entity,
          text: "Generate Children",
        );
        final stream = scriptGenerator.children.generateToDirectory(
          directoryBase: directory_base,
          onWritting: onWritting,
          isSkipAutoRename: isSkipAutoRename,
        );
        await for (var event in stream) {
          yield event;
        }
      } else {
        // yield ScriptGeneratorStatus(
        //   file_system_entity: scriptGenerator.file_system_entity,
        //   text: "Unimplemented: ${}",
        // );

        // unimplemented link
      }
    }

    return;
  }

  /// GeneralLib

  Map toJson() {
    final List<Map> scripts = map((e) => e.toJson()).toList(
      growable: true,
    );
    return {
      "@type": "scriptGenerators",
      "total_count": scripts.length,
      "scripts": scripts,
    };
  }

  /// GeneralLib
  List<Map> toJsonList() {
    final List<Map> scripts = map((e) => e.toJson()).toList(
      growable: true,
    );
    return scripts;
  }

  /// GeneralLib
  String toStringData() {
    return (toJsonList().toStringifyPretty());
  }

  /// GeneralLib
  String toScriptDart({
    required String scriptName,
  }) {
    final String script_dart_generate = """
// ignore_for_file: non_constant_identifier_names

// import 'io_universe/io_universe.dart';
import 'package:general_lib/script_generate/script_generate.dart';
import 'package:io_universe/io_universe.dart';

final List<ScriptGenerator> ${scriptName}_script_generators = [
  ${map((e) => e.toScriptDart()).join(",\n")}
];
 
""";
    return script_dart_generate;
  }
}
