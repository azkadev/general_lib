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
import 'package:io_universe/io_universe.dart';

import 'package:archive/archive_io.dart';
import 'package:general_lib/file_system_entity/file_system_entity.dart';
import 'package:general_lib/glob/glob.dart';
import "package:path/path.dart" as path_package;

/// ArchiveGeneralLibOptions
class ArchiveGeneralLibOptions {
  /// archive
  final String fileSystemEntityIgnore;

  /// archive
  final bool isUseFileSystemEntityIgnore;

  /// archive
  final bool isVerbose;

  /// ArchiveGeneralLibOptions
  ArchiveGeneralLibOptions({
    /// GeneralLibrary
    required this.fileSystemEntityIgnore,

    /// GeneralLibrary
    required this.isUseFileSystemEntityIgnore,

    /// GeneralLibrary
    required this.isVerbose,
  });

  /// copy options
  ArchiveGeneralLibOptions copyWith({
    /// GeneralLibrary
    String? fileSystemEntityIgnore,

    /// GeneralLibrary
    bool? isUseFileSystemEntityIgnore,

    /// GeneralLibrary
    bool? isVerbose,
  }) {
    return ArchiveGeneralLibOptions(
      fileSystemEntityIgnore:
          fileSystemEntityIgnore ?? this.fileSystemEntityIgnore,
      isUseFileSystemEntityIgnore:
          isUseFileSystemEntityIgnore ?? this.isUseFileSystemEntityIgnore,
      isVerbose: isVerbose ?? this.isVerbose,
    );
  }

  /// archive
  static ArchiveGeneralLibOptions empty({
    /// GeneralLibrary
    String fileSystemEntityIgnore = "",

    /// GeneralLibrary
    bool isUseFileSystemEntityIgnore = true,

    /// GeneralLibrary
    bool isVerbose = false,
  }) {
    return ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: fileSystemEntityIgnore,
      isUseFileSystemEntityIgnore: isUseFileSystemEntityIgnore,
      isVerbose: isVerbose,
    );
  }
}

/// archive
extension ArchiveGeneralLibExtensionFileSystemEntityToArchiveFile
    on FileSystemEntity {
  /// archive file
  ArchiveFile toArchiveFile({
    /// GeneralLibrary
    required String name,
  }) {
    return ArchiveFile.stream(
      name,
      InputFileStream(path),
    );
  }
}

/// ArchiveGeneralLib
class ArchiveGeneralLib {
  /// GeneralLibrary
  final Archive archive = Archive();

  /// ArchiveGeneralLib
  ArchiveGeneralLib();

  /// archive directory
  void addFilesByDirectory({
    /// GeneralLibrary
    required Directory directory,

    /// GeneralLibrary
    required Directory directoryBase,

    /// GeneralLibrary
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final List<String> fileSystemEntityIgnores =
        (archiveGeneralLibOptions.isUseFileSystemEntityIgnore)
            ? archiveGeneralLibOptions.fileSystemEntityIgnore.toGlob()
            : [];
    if (archiveGeneralLibOptions.isUseFileSystemEntityIgnore) {
      for (final element in FileSystemEntityIgnore.getFileIgnoresByDirectory(
          currentPath: directory.uri.toFilePath())) {
        if (fileSystemEntityIgnores.contains(element) == false) {
          fileSystemEntityIgnores.add(element);
        }
      }
    }
    final List<RegExp> fileSystemEntityIgnoresRegexp =
        fileSystemEntityIgnores.map((e) => RegExp(e)).toList();

    for (final element in directory.listSync()) {
      if (fileSystemEntityIgnoresRegexp.globContains(element.path)) {
        continue;
      }
      if (element is Directory) {
        addFilesByDirectory(
          directory: element,
          directoryBase: directoryBase,
          archiveGeneralLibOptions: archiveGeneralLibOptions.copyWith(
            fileSystemEntityIgnore: fileSystemEntityIgnores.join("\n"),
          ),
        );
      } else if (element is File) {
        addFile(
          fileSystemEntity: element,
          name: path_package.relative(element.uri.toFilePath(),
              from: directoryBase.uri.toFilePath()),
        );
      }
    }
    fileSystemEntityIgnores.clear();
    fileSystemEntityIgnoresRegexp.clear();
  }

  /// add any file
  void addFile({
    /// GeneralLibrary
    required FileSystemEntity fileSystemEntity,

    /// GeneralLibrary
    required String name,
  }) {
    archive.addFile(fileSystemEntity.toArchiveFile(
      name: name,
    ));
    return;
  }

  /// archive to zip bytes
  List<int>? toZipBytes({
    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    int level = DeflateLevel.bestSpeed,

    /// GeneralLibrary
    OutputStream? output,

    /// GeneralLibrary
    DateTime? modified,

    /// GeneralLibrary
    bool autoClose = true,
  }) {
    final ZipEncoder zipEncoder = ZipEncoder(
      password: password,
    );

    return zipEncoder.encode(
      archive,
      level: level,
      modified: modified ?? DateTime.now(),
      autoClose: autoClose,
    );
  }

  /// decode zip
  Archive zipDecoder({
    /// GeneralLibrary
    required String path,

    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    required bool verify,
  }) {
    final ZipDecoder zipDecoder = ZipDecoder();
    return zipDecoder.decodeStream(InputFileStream(path),
        password: password, verify: verify);
  }

  /// close
  void close() {
    archive.clearSync();
  }

  /// close async
  Future<void> closeAsync() async {
    await archive.clear();
  }

  /// create archive zip
  static File createArchiveZip({
    /// GeneralLibrary
    required Directory directory,

    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    required File outPutFile,

    /// GeneralLibrary
    DateTime? modified,

    /// GeneralLibrary
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
    archiveGeneralLib.addFilesByDirectory(
      directory: directory,
      archiveGeneralLibOptions: archiveGeneralLibOptions,
      directoryBase: directory,
    );
    final result = archiveGeneralLib.toZipBytes(
      password: password,
      modified: modified,
    );
    if (result != null) {
      if (outPutFile.parent.existsSync() == false) {
        outPutFile.parent.createSync(recursive: true);
      }
      outPutFile.writeAsBytesSync(result);
    }
    archiveGeneralLib.close();

    return outPutFile;
  }

  /// create archive zip async
  static Future<File> createArchiveZipAsync({
    /// GeneralLibrary
    required Directory directory,

    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    required File outPutFile,

    /// GeneralLibrary
    DateTime? modified,

    /// GeneralLibrary
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) async {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
    archiveGeneralLib.addFilesByDirectory(
      directory: directory,
      archiveGeneralLibOptions: archiveGeneralLibOptions,
      directoryBase: directory,
    );
    final result = archiveGeneralLib.toZipBytes(
      password: password,
      modified: modified,
    );
    if (result != null) {
      if (outPutFile.parent.existsSync() == false) {
        await outPutFile.parent.create(recursive: true);
      }
      await outPutFile.writeAsBytes(result);
    }
    await archiveGeneralLib.closeAsync();

    return outPutFile;
  }

  /// extract archive zip
  static Directory extractArchiveZip({
    /// GeneralLibrary
    required File archivedFile,

    /// GeneralLibrary
    required Directory directoryOutput,

    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    required bool verify,

    /// GeneralLibrary
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
    extractArchiveToDiskSync(
      archiveGeneralLib.zipDecoder(
        path: archivedFile.path,
        password: password,
        verify: verify,
      ),
      directoryOutput.uri.toFilePath(),
    );
    archiveGeneralLib.close();

    return directoryOutput;
  }

  /// extract archive zip async
  static Future<Directory> extractArchiveZipAsync({
    /// GeneralLibrary
    required File archivedFile,

    /// GeneralLibrary
    required Directory directoryOutput,

    /// GeneralLibrary
    required String? password,

    /// GeneralLibrary
    bool verify = true,

    /// GeneralLibrary
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) async {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
    await extractArchiveToDisk(
      archiveGeneralLib.zipDecoder(
        path: archivedFile.path,
        password: password,
        verify: verify,
      ),
      directoryOutput.uri.toFilePath(),
    );
    await archiveGeneralLib.closeAsync();
    return directoryOutput;
  }
}
