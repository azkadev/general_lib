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
// ignore_for_file: non_constant_identifier_names, unused_catch_stack, empty_catches

import 'dart:async';

import 'package:general_lib/extension/regexp.dart';
import 'package:io_universe/io_universe.dart';

import "package:path/path.dart" as path;

/// GeneralLib
extension DirectoryHelper on Directory {
  /// GeneralLib
  Directory generalLibUtilsDangerRecreate() {
    if (existsSync()) {
      deleteSync(recursive: true);
    }
    createSync(recursive: true);
    return this;
  }

  /// Recursively copies a directory + subdirectories into a target directory.
  /// Similar to Copy-Item in PowerShell.
  void copyTo(
    final Directory destination, {
    final List<String> ignoreDirList = const [],
    final List<String> ignoreFileList = const [],
  }) {
    if (destination.existsSync() == false) {
      destination.createSync(
        recursive: true,
      );
    }
    listSync().forEach((final entity) {
      List<String> slebews = path.split(entity.path);
      if (slebews.contains(".git")) {
        return;
      }
      if (slebews.contains(".dart_tool")) {
        return;
      }
      if (entity is Directory) {
        if (ignoreDirList.contains(path.basename(entity.path))) {
          return;
        }
        final newDirectory = Directory(
          path.join(destination.absolute.path, path.basename(entity.path)),
        )..createSync();
        entity.absolute.copyTo(newDirectory);
      } else if (entity is File) {
        if (ignoreFileList.contains(path.basename(entity.path))) {
          return;
        }

        entity.copySync(
          path.join(destination.path, path.basename(entity.path)),
        );
      }
    });
  }

  // void renameRecursive({
  //   required String origin_name,
  //   required String new_name,
  //   final List<String> ignoreDirList = const [],
  //   final List<String> ignoreFileList = const [],
  // }) {

  //   try {
  //     listSync(recursive: true).forEach((FileSystemEntity entity) {
  //       try {
  //         if (entity is Directory) {
  //           if (ignoreDirList.contains(path.basename(entity.path))) {
  //             return;
  //           }
  //           if (RegExp(origin_name, caseSensitive: false).hashData(path.basename(entity.path))) {
  //             var file_path = entity.path.replaceAll(RegExp(origin_name, caseSensitive: false), new_name);
  //             entity.renameSync(file_path);
  //           }
  //           Directory(entity.path).renameRecursive(origin_name: origin_name, new_name: new_name);
  //         } else if (entity is File) {
  //           if (ignoreFileList.contains(path.basename(entity.path))) {
  //             return;
  //           }
  //           try {
  //             String data = entity.readAsStringSync();

  //             if (RegExp(origin_name, caseSensitive: false).hashData(data)) {
  //               entity.writeAsStringSync(data.replaceAll(RegExp(origin_name, caseSensitive: false), new_name));
  //             }
  //           } catch (e) {}

  //           if (RegExp(origin_name, caseSensitive: false).hashData(path.basename(entity.path))) {
  //             var file_path = entity.path.replaceAll(RegExp(origin_name, caseSensitive: false), new_name);
  //             entity.renameSync(file_path);
  //           }
  //           // entity.copySync(
  //           //   path.join(destination.path, path.basename(entity.path)),
  //           // );
  //         }
  //       } catch (e) {}
  //     });
  //   } catch (e) {}
  // }
  /// GeneralLib
  void renameRecursive({
    required String origin_name,
    required String new_name,
    bool caseSensitiveFile = true,
    final List<String> ignoreDirList = const [],
    final List<String> ignoreFileList = const [],
  }) {
    List<FileSystemEntity> fileSystemEntitys = listSync();
    for (var i = 0; i < fileSystemEntitys.length; i++) {
      FileSystemEntity entity = fileSystemEntitys[i];
      try {
        if (entity is Directory) {
          if (ignoreDirList.contains(path.basename(entity.path))) {
            continue;
          }
          if (RegExp(origin_name, caseSensitive: false)
              .hashData(path.basename(entity.path))) {
            var file_path = entity.path.replaceAll(
                RegExp(origin_name, caseSensitive: false), new_name);
            entity.renameSync(file_path);
            Directory(file_path).renameRecursive(
                origin_name: origin_name,
                new_name: new_name,
                ignoreDirList: ignoreDirList,
                ignoreFileList: ignoreFileList);
          } else {
            entity.absolute.renameRecursive(
                origin_name: origin_name,
                new_name: new_name,
                ignoreDirList: ignoreDirList,
                ignoreFileList: ignoreFileList);
          }
        } else if (entity is File) {
          if (ignoreFileList.contains(path.basename(entity.path))) {
            continue;
          }
          try {
            String data = entity.readAsStringSync();
            if (RegExp(origin_name, caseSensitive: caseSensitiveFile)
                .hashData(data)) {
              entity.writeAsStringSync(data.replaceAll(
                  RegExp(origin_name, caseSensitive: caseSensitiveFile),
                  new_name));
            }
          } catch (e) {}

          if (RegExp(origin_name, caseSensitive: false)
              .hashData(path.basename(entity.path))) {
            var file_path = entity.path.replaceAll(
                RegExp(origin_name, caseSensitive: false), new_name);
            entity.renameSync(file_path);
          }
        }
      } catch (e, stack) {}
    }
    return;
  }

  /// GeneralLib

  void renameRecursiveSync({
    required String origin_name,
    required String new_name,
    final List<String> ignoreDirList = const [],
    final List<String> ignoreFileList = const [],
  }) {
    List<FileSystemEntity> fileSystemEntitys = listSync();
    for (var i = 0; i < fileSystemEntitys.length; i++) {
      FileSystemEntity entity = fileSystemEntitys[i];
      try {
        if (entity is Directory) {
          if (ignoreDirList.contains(path.basename(entity.path))) {
            continue;
          }
          if (RegExp(origin_name, caseSensitive: false)
              .hashData(path.basename(entity.path))) {
            var file_path = entity.path.replaceAll(
                RegExp(origin_name, caseSensitive: false), new_name);
            entity.renameSync(file_path);
            Directory(file_path).renameRecursive(
                origin_name: origin_name,
                new_name: new_name,
                ignoreDirList: ignoreDirList,
                ignoreFileList: ignoreFileList);
          } else {
            entity.absolute.renameRecursive(
                origin_name: origin_name,
                new_name: new_name,
                ignoreDirList: ignoreDirList,
                ignoreFileList: ignoreFileList);
          }
        } else if (entity is File) {
          if (ignoreFileList.contains(path.basename(entity.path))) {
            continue;
          }
          try {
            String data = entity.readAsStringSync();
            if (RegExp(origin_name, caseSensitive: false).hashData(data)) {
              entity.writeAsStringSync(data.replaceAll(
                  RegExp(origin_name, caseSensitive: false), new_name));
            }
          } catch (e) {}

          if (RegExp(origin_name, caseSensitive: false)
              .hashData(path.basename(entity.path))) {
            var file_path = entity.path.replaceAll(
                RegExp(origin_name, caseSensitive: false), new_name);
            entity.renameSync(file_path);
          }
        }
      } catch (e, stack) {}
    }
    return;
  }

  /// GeneralLib

  Future<void> recursive({
    required FutureOr<void> Function(FileSystemEntity fileSystemEntity) onData,
  }) async {
    List<FileSystemEntity> fileSystemEntitys = listSync();

    for (var i = 0; i < fileSystemEntitys.length; i++) {
      FileSystemEntity fileSystemEntity = fileSystemEntitys[i];

      await onData(fileSystemEntity);

      if (fileSystemEntity is Directory) {
        if ((await fileSystemEntity.exists())) {
          await fileSystemEntity.recursive(onData: onData);
        }
      } else if (fileSystemEntity is File) {}
    }
  }
}
