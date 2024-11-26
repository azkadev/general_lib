// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'dart:io';

import 'package:general_lib/archive/archive.dart';
import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/dart/resolve_package_uri/resolve_package_uri.dart';
import 'package:general_lib/extension/directory.dart';
import 'package:general_lib/general_lib_core.dart';
// import 'package:general_lib/general_lib.d/art';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;
import "package:yaml/yaml.dart" as yaml;

class Pub {
  Directory get base_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    String? configDir;
    if (Platform.isLinux) {
      configDir = path.join(
          Platform.environment['XDG_CONFIG_HOME'] ??
              Platform.environment['HOME']!,
          '.pub-cache');
    } else if (Platform.isWindows) {
      configDir = Platform.environment['APPDATA']!;
    } else if (Platform.isMacOS) {
      configDir = path.join(
          Platform.environment['HOME']!, 'Library', 'Application Support');
    } else {
      configDir = path.join(Platform.environment['HOME'] ?? '', '.pub-cache');
    }
    return Directory(configDir);
  }

  Directory get bin_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "bin"));
  }

  Directory get git_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "git"));
  }

  Directory get global_packages_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "global_packages"));
  }

  Directory get hosted_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "hosted"));
  }

  Directory get hosted_hashes_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "hosted-hashes"));
  }

  Directory get temp_directory {
    if (Dart.isWeb) {
      return Directory("");
    }
    return Directory(path.join(base_directory.path, "_temp"));
  }

  Directory? installFromDirectory({
    required Directory directoryPackage,
    bool deleteIfExist = true,
  }) {
    if (Dart.isWeb) {
      return null;
    }
    final File file_pubspec =
        File(path.join(directoryPackage.path, "pubspec.yaml"));
    if (file_pubspec.existsSync() == false) {
      return null;
    }
    final Map yaml_code =
        (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);
    final Directory directory_pub_dev = Directory(path.join(
        hosted_directory.path,
        "pub.dev",
        "${yaml_code["name"]}-${yaml_code["version"]}"));
    if (deleteIfExist && directory_pub_dev.existsSync()) {
      directory_pub_dev.deleteSync(recursive: true);
      directory_pub_dev.createSync(recursive: true);
    }
    directoryPackage.copyTo(directory_pub_dev);
    return directory_pub_dev;
  }

  File? archiveDirectory({
    required Directory directoryPackage,
    String? password,
    required Directory directoryOutPut,
    String fileSystemEntityIgnore = "",
  }) {
    if (Dart.isWeb) {
      return null;
    }
    final File file_pubspec =
        File(path.join(directoryPackage.path, "pubspec.yaml"));
    if (file_pubspec.existsSync() == false) {
      return null;
    }
    final Map yaml_code =
        (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);
    return ArchiveGeneralLib.createArchiveZip(
      directory: directoryPackage,
      password: password,
      outPutFile: File(path.join(directoryOutPut.uri.toFilePath(),
          "${yaml_code["name"]}-${yaml_code["version"]}")),
      archiveGeneralLibOptions: ArchiveGeneralLibOptions(
        fileSystemEntityIgnore: """
.git
.dart_tool
$fileSystemEntityIgnore
""",
        isUseFileSystemEntityIgnore: true,
        isVerbose: false,
      ),
    );
  }

  Directory? installFromArchive({
    required File archivedFile,
    String? password,
    bool deleteIfExist = true,
    String fileSystemEntityIgnore = "",
  }) {
    if (Dart.isWeb) {
      return null;
    }

    Directory directory_ouput_temp =
        Directory(path.join(temp_directory.uri.toFilePath(), generateUuid(10)));

    if (directory_ouput_temp.existsSync()) {
      {
        int try_count = 0;
        while (true) {
          if (++try_count > 10) {
            throw "Error";
          }
          directory_ouput_temp = Directory(
              path.join(temp_directory.uri.toFilePath(), generateUuid(10)));
          if (directory_ouput_temp.existsSync() == false) {
            break;
          }
        }
      }
    }

    final Directory directory = ArchiveGeneralLib.extractArchiveZip(
      archivedFile: archivedFile,
      directoryOutput: directory_ouput_temp,
      password: password,
      verify: true,
      archiveGeneralLibOptions:
          ArchiveGeneralLibOptions(fileSystemEntityIgnore: """
.git
.dart_tool
$fileSystemEntityIgnore
""", isUseFileSystemEntityIgnore: true, isVerbose: false),
    );

    try {
      final Directory? directoryresult = installFromDirectory(
        directoryPackage: directory,
        deleteIfExist: deleteIfExist,
      );

      directory_ouput_temp.deleteSync(recursive: true);
      return directoryresult;
    } catch (e) {
      directory_ouput_temp.deleteSync(recursive: true);
      rethrow;
    }
  }

  Directory? installFromDirectoryFresh({
    required Directory directoryPackage,
    String? password,
    bool deleteIfExist = true,
    Directory? directoryOutPut,
    String fileSystemEntityIgnore = "",
  }) {
    final res = archiveDirectory(
      directoryPackage: directoryPackage,
      password: password,
      directoryOutPut: Directory(
          path.join((directoryOutPut ?? Directory.current).path, "temp")),
      fileSystemEntityIgnore: fileSystemEntityIgnore,
    );
    if (res == null) {
      return null;
    }
    try {
      final installed_dir = installFromArchive(
        archivedFile: res,
        password: password,
        fileSystemEntityIgnore: fileSystemEntityIgnore,
        deleteIfExist: deleteIfExist,
      );
      res.deleteSync(recursive: true);
      return installed_dir;
    } catch (e) {
      res.deleteSync(recursive: true);
      rethrow;
    }
  }

  Uri? resolvePackageUri(Uri uri) {
    if (Dart.isWeb) {
      return null;
    }
    return resolvePackageUriSync(uri);
  }

  Directory? resolvePackageBase(Uri uri) {
    if (Dart.isWeb) {
      return null;
    }
    Uri? result = resolvePackageUriSync(uri);
    if (result == null) {
      return null;
    }
    for (var i = 0; i < path.split(result.toFilePath()).length; i++) {
      File file_pubspec = File(path.join(
          Directory(path.join(result.toFilePath(),
                  List.generate(i, (index) => "..").join(Dart.pathSeparator)))
              .uri
              .toFilePath(),
          "pubspec.yaml"));
      if (file_pubspec.existsSync()) {
        return file_pubspec.parent;
      }
    }

    return null;
  }
}
