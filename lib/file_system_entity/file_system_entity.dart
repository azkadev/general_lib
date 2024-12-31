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

import 'package:general_lib/general_lib.dart';
import 'package:io_universe/io_universe.dart';

import "package:path/path.dart" as path;

class FileSystemEntityIgnore {
  static List<String> ignoreFileNames = [
    ".gitignore",
    ".pubignore",
  ];
  static List<String> getFileIgnoresByDirectory({
    required String currentPath,
  }) {
    final List<String> results = [];
    for (final ignoreFileName in ignoreFileNames) {
      final File file_ignore = File(path.join(currentPath, ignoreFileName));
      // print(file_ignore);
      if (file_ignore.existsSync() == false) {
        continue;
      }

      // final data = file_ignore.readAsStringSync().toGlob();
      for (final element in file_ignore.readAsStringSync().toGlob()) {
        if (results.contains(element) == false) {
          results.add(element);
        }
      }
    }
    return results;
  }
}

extension ExtensionOnStorTtpe on List<FileSystemEntity> {
  List<FileSystemEntity> local_sort({
    SortFileSystemEntityType sortFileSystemEntityType = SortFileSystemEntityType.type,
  }) {
    switch (sortFileSystemEntityType) {
      case SortFileSystemEntityType.name:
        sort((a, b) => a.path.compareTo(b.path));
        break;
      case SortFileSystemEntityType.size:
        sort((a, b) => a.statSync().size.compareTo(b.statSync().size));
        break;
      case SortFileSystemEntityType.time:
        sort((a, b) => a.statSync().modified.compareTo(b.statSync().modified));
        break;
      case SortFileSystemEntityType.type:
        sort((a, b) {
          if (a is Directory && b is Directory) {
            return a.path.toLowerCase().compareTo(b.path.toLowerCase());
          } else if (a is Directory) {
            return -1;
          } else if (b is Directory) {
            return 1;
          } else {
            // Memisahkan file normal dan hidden file
            final isHiddenA = a.path.startsWith('.');
            final isHiddenB = b.path.startsWith('.');

            if (isHiddenA && isHiddenB) {
              return a.path.toLowerCase().compareTo(b.path.toLowerCase());
            } else if (isHiddenA) {
              return 1;
            } else if (isHiddenB) {
              return -1;
            } else {
              return a.path.toLowerCase().compareTo(b.path.toLowerCase());
            }
          }
        });
        break;
    }
    return this;
  }

  List<FileSystemEntityChildren> toTree() {
    List<FileSystemEntityChildren> sles = [];

    local_sort();

    for (var i = 0; i < length; i++) {
      FileSystemEntity fileSystemEntity = this[i];
      if (fileSystemEntity is File) {
        sles.add(FileSystemEntityChildren(
          fileSystemEntity: fileSystemEntity,
          state_data: {},
          fileSystemEntityType: fileSystemEntity.statSync().type,
          children: [],
        ));
      } else if (fileSystemEntity is Directory) {
        sles.add(FileSystemEntityChildren(
          fileSystemEntity: fileSystemEntity,
          state_data: {},
          fileSystemEntityType: fileSystemEntity.statSync().type,
          children: fileSystemEntity.listSync().clone<FileSystemEntity>().local_sort().toTree(),
        ));
      } else {
        sles.add(FileSystemEntityChildren(
          fileSystemEntity: fileSystemEntity,
          state_data: {},
          fileSystemEntityType: fileSystemEntity.statSync().type,
          children: [],
        ));
      }
    }
    return sles;
  }
}

extension FileSaloslapsExtension on List<FileSystemEntityChildren> {
  List<Map> toJson() {
    return map((e) => e.toJson()).toList(
      growable: true,
    );
  }

  String toStringData() {
    return (toJson().toStringifyPretty());
  }
}

class FileSystemEntityChildren {
  FileSystemEntity fileSystemEntity;
  Map state_data = {};
  FileSystemEntityType fileSystemEntityType;
  List<FileSystemEntityChildren> children;
  FileSystemEntityChildren({
    required this.fileSystemEntity,
    required this.state_data,
    required this.fileSystemEntityType,
    required this.children,
  });

  Map toJson() {
    return {
      "@type": "fileSystemEntityChildren",
      "path": fileSystemEntity.path,
      "type": fileSystemEntityType.toString(),
      "children": children.map((e) => e.toJson()).toList(
            growable: true,
          ),
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
