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
// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:async';
import 'package:io_universe/io_universe.dart';
import 'dart:isolate';

import 'package:general_lib/extension/date_time.dart';
import 'package:general_lib/extension/directory.dart';
import 'package:general_lib/extension/regexp.dart';
import 'package:general_lib/extension/string.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart';
import "scheme/scheme.dart" as general_lib_scheme;

/// GeneralLibrary
Logger logger = Logger(
  level: Level.verbose,
);

/// GeneralLibrary
Future<Directory?> getPackageDirectory({
  String package_name = "package:general_lib/general_lib.dart",
}) async {
  Uri? res = await Isolate.resolvePackageUri(Uri.parse(package_name));
  if (res == null) {
    return null;
  }

  List<String> paths = [...res.pathSegments];
  for (var i = 0; i < package_name.split("/").length; i++) {
    paths.removeLast();
  }
  Directory directory = Directory(joinAll(paths));

  if (!directory.existsSync()) {
    directory = Directory(joinAll(["/", ...paths]));
  }
  return directory;
}

/// GeneralLibrary
class GeneralLibCli {
  /// GeneralLibrary
  Directory base_directory = Directory.current;

  /// GeneralLibrary
  Directory lib_directory = Directory.current;

  /// GeneralLibrary
  GeneralLibCli();

  /// GeneralLibrary
  Future<void> init() async {
    Uri? res = await Isolate.resolvePackageUri(
        Uri.parse("package:general_lib/general_lib.dart"));
    if (res == null) {
      return;
    }
    String base_path =
        "${Platform.pathSeparator}${res.pathSegments.take(res.pathSegments.length - 2).toList().join(Platform.pathSeparator)}";
    base_directory = Directory(base_path);
    lib_directory = Directory(join(base_directory.path, "lib"));
    return;
  }

  /// GeneralLibrary
  FutureOr<File> addPackageByFileScriptDart({
    required File fileScriptDart,
    required List<String> new_packages,
  }) async {
    String scriptDart = await fileScriptDart.readAsString();
    return await fileScriptDart.writeAsString(addPackageByStringScriptDart(
      scriptDart: scriptDart,
      new_packages: new_packages,
    ));
  }

  /// GeneralLibrary
  String addPackageByStringScriptDart({
    required String scriptDart,
    required List<String> new_packages,
  }) {
    List<String> scripts = scriptDart.split("\n");
    bool is_found_import_first = false;
    // bool is_found_import_last = false;
    int index_found_import_first = 0;
    int index_found_import_last = 0;
    for (var i = 0; i < scripts.length; i++) {
      String loop_text = scripts[i];
      if (!is_found_import_first) {
        if (RegExp(r"import", caseSensitive: false).hashData(loop_text)) {
          index_found_import_first = i;
          is_found_import_first = true;
        }
        continue;
      }
      if (RegExp(r"import", caseSensitive: false).hashData(loop_text)) {
        // is_found_import_last = true;
        index_found_import_last = i;
      }
    }
    for (var index = 0; index < new_packages.length; index++) {
      String new_package = new_packages[index];
      String package_to_regex = (new_package
          .replaceAll(RegExp(r"([ ]+)"), "([ ]+)?")
          .replaceAll(RegExp("(\"|')"), "(\"|')")
          .replaceAll(RegExp("\n"), ""));
      for (var i = 0; i < index_found_import_last + 1; i++) {
        String loop_text = scripts[i];
        if (i < index_found_import_first) {
          continue;
        }
        if (RegExp(package_to_regex, caseSensitive: false)
            .hashData(loop_text)) {
          break;
        }
        if (index_found_import_last == i) {
          scripts.insert((i + 1), new_package);
          index_found_import_last += 1;
          break;
        }
      }
    }
    return scripts.join("\n");
  }

  Future<general_lib_scheme.TemplateDatas> getTemplatesByDirectory({
    required Directory? template_directory,
    Duration? durationTimeOut,
  }) async {
    durationTimeOut ??= const Duration(minutes: 1);
    DateTime dateTimeTimeOut = DateTime.now().add(durationTimeOut);
    template_directory ??= Directory(join(base_directory.path, "template"));
    List<FileSystemEntity> dir_template = [];
    bool is_complete = false;

    var str = template_directory.list().listen(
      (FileSystemEntity fileSystemEntity) {
        if (fileSystemEntity.statSync().type ==
            FileSystemEntityType.directory) {
          dir_template.add(fileSystemEntity);
        }
      },
      onDone: () {
        is_complete = true;
      },
      cancelOnError: true,
    );
    List<general_lib_scheme.TemplateData> template_datas = [];
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1));
      if (dateTimeTimeOut.isExpired()) {
        await str.cancel();
        return general_lib_scheme.TemplateDatas({
          "@type": "error",
          "message": "time_out",
          "description": "Time out",
        });
      }
      if (is_complete) {
        await str.cancel();
        break;
      }
    }
    for (var i = 0; i < dir_template.length; i++) {
      template_datas.add(general_lib_scheme.TemplateData.create(
        special_type: "templateData",
        name: basename(dir_template[i].path),
        path: dir_template[i].path,
        data: [],
      ));
    }
    return general_lib_scheme.TemplateDatas.create(
      special_type: "templateDatas",
      count: dir_template.length,
      templates: template_datas,
    );
  }

  Future<general_lib_scheme.ProjectData> createTemplateByDirectory({
    required String name,
    bool is_force = false,
    required List<String> templates,
    required Directory? template_directory,
    required Directory directory_out,
    required FutureOr<void> Function(String text) onProcces,
  }) async {
    template_directory ??= Directory(join(base_directory.path, "template"));
    try {
      Directory directory_create = Directory(join(directory_out.path, name));
      if (name == ".") {
        name = basename(Directory.current.path);
        directory_create = Directory(join(directory_out.path));
      }
      if (directory_create.existsSync()) {
        if (!is_force) {
          return general_lib_scheme.ProjectData({
            "@type": "error",
            "message": "directory_out_exists",
            "description":
                "Directory ${directory_create.path} already exists (use '--force' to force project generation)"
          });
        }
      }
      await directory_create.create(recursive: true);
      if (templates.isEmpty) {
        templates = ["app_template"];
      }
      if (templates.first == "fullstack_template") {
        templates = [
          "app_template",
          "server_template",
          "client_template",
        ];
      }
      if (templates.first == "fullstack_api_template") {
        templates = [
          "app_api_template",
          "server_api_template",
          "client_api_template",
        ];
      }
      logger.info("Creating ${name} using template ${templates.join(",")}...");
      // await onProcces("Creating ${name} using template ${templates.join(",")}...");
      Progress progress = logger.progress("Starting Create Template");
      await Future.delayed(Duration(milliseconds: 500));
      if (templates.length > 1) {
        for (var i = 0; i < templates.length; i++) {
          String template = templates[i];
          Directory directory_template_package =
              Directory(join(template_directory.path, template));
          if (!directory_template_package.existsSync()) {
            return general_lib_scheme.ProjectData({
              "@type": "error",
              "message": "template_not_found",
              "description":
                  "Failed Creating ${name} using template ${template} karena tidak ada template"
            });
          }

          // await onProcces("Create ${template}");

          progress.update("Create ${template}");
          await Future.delayed(Duration(milliseconds: 500));
          Directory directory_create_folder =
              Directory(join(directory_create.path, template));
          if (!directory_create_folder.existsSync()) {
            await directory_create_folder.create(recursive: true);
          }
          directory_template_package.copyTo(
            directory_create_folder,
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          progress.update("Install File");
          await Future.delayed(Duration(milliseconds: 500));

          directory_create_folder.renameRecursive(
            origin_name: template,
            new_name: "${name}_${template.split("_").first}",
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );

          progress.update("Rename");
          await Future.delayed(Duration(milliseconds: 500));

          directory_create.renameRecursive(
            origin_name: template,
            new_name: "${name}_${template.split("_").first}",
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          progress.update("Rename");
          await Future.delayed(Duration(milliseconds: 500));

          directory_create.renameRecursive(
            origin_name: template.split("_").join(" "),
            new_name:
                "${name}_${template.split("_").first}".split("_").map((e) {
              String text_name = "";
              for (var index_name_loop_data = 0;
                  index_name_loop_data < e.length;
                  index_name_loop_data++) {
                String text_loop_name = e[index_name_loop_data];
                if (index_name_loop_data == 0) {
                  text_name += text_loop_name.toUpperCase();
                } else {
                  text_name += text_loop_name.toLowerCase();
                }
              }
              return text_name;
            }).join(" "),
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          progress.update("Rename");
          await Future.delayed(Duration(milliseconds: 500));
          directory_create.renameRecursive(
            origin_name: template.camelCaseClass(),
            new_name: "${name}_${template.split("_").first}".camelCaseClass(),
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          directory_create.renameRecursive(
            origin_name: template.camelCaseClass().toLowerCaseFirstData(),
            new_name: "${name}_${template.split("_").first}"
                .camelCaseClass()
                .toLowerCaseFirstData(),
            ignoreDirList: [
              "build",
              ".dart_tool",
              "node_modules",
            ],
            ignoreFileList: [
              "pubspec.lock",
            ],
          );
          progress.update("Finished Create Template: ${template}");
          await Future.delayed(Duration(milliseconds: 500));
          // directory_create.renameRecursive(
          //   origin_name: template.split("_").join(" "),
          //   new_name: "${name}_${template.split("_").first}".camelCaseClass(),
          //   ignoreDirList: [
          //     "build",
          //     ".dart_tool",
          //     "node_modules",
          //   ],
          //   ignoreFileList: [
          //     "pubspec.lock",
          //   ],
          // );
        }
      } else {
        String template = templates.first;
        Directory directory_template_package =
            Directory(join(template_directory.path, template));

        if (!directory_template_package.existsSync()) {
          return general_lib_scheme.ProjectData({
            "@type": "error",
            "message": "template_not_found",
            "description":
                "Failed Creating ${name} using template ${template} karena tidak ada template"
          });
        }

        progress.update("Copy Files");

        directory_template_package.copyTo(
          directory_create,
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );

        progress.update("Rename Template");
        directory_create.renameRecursive(
          origin_name: template,
          new_name: name,
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );

        directory_create.renameRecursive(
          origin_name: template.split("_").join(" "),
          new_name: name.split("_").map((e) {
            String text_name = "";
            for (var index_name_loop_data = 0;
                index_name_loop_data < e.length;
                index_name_loop_data++) {
              String text_loop_name = e[index_name_loop_data];
              if (index_name_loop_data == 0) {
                text_name += text_loop_name.toUpperCase();
              } else {
                text_name += text_loop_name.toLowerCase();
              }
            }
            return text_name;
          }).join(" "),
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );

        progress.update("Rename Script File");
        directory_create.renameRecursive(
          origin_name: template.camelCaseClass(),
          new_name: name.camelCaseClass(),
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );
        directory_create.renameRecursive(
          origin_name: template.camelCaseClass().toLowerCaseFirstData(),
          new_name: name.camelCaseClass().toLowerCaseFirstData(),
          ignoreDirList: [
            "build",
            ".dart_tool",
            "node_modules",
          ],
        );
      }

      progress.complete("Done");
      return general_lib_scheme.ProjectData({
        "@type": "projectData",
        "name": name,
        "directory_out_path": directory_out.path,
        "message": """
Created project ${name} ! In order to get started, run the following commands:

  cd ${name}
  flutter clean
  flutter create .
  flutter pub get
"""
      });
    } catch (e) {
      return general_lib_scheme.ProjectData({
        "@type": "error",
        "message": "script_error",
        "description": "Error Script: ${e}"
      });
    }
  }

  calculationPrize() async {}

  request({
    required String method,
    required Map parameters,
  }) async {}
}
