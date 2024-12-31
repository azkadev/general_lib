import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:general_lib/file_system_entity/file_system_entity.dart';
import 'package:general_lib/glob/glob.dart';
import 'package:io_universe/io_universe.dart';
import "package:path/path.dart" as path_package;

/// ArchiveGeneralLibOptions
class ArchiveGeneralLibOptions {
  final String fileSystemEntityIgnore;
  final bool isUseFileSystemEntityIgnore;
  final bool isVerbose;
  ArchiveGeneralLibOptions({
    required this.fileSystemEntityIgnore,
    required this.isUseFileSystemEntityIgnore,
    required this.isVerbose,
  });

  /// copy options
  ArchiveGeneralLibOptions copyWith({
    String? fileSystemEntityIgnore,
    bool? isUseFileSystemEntityIgnore,
    bool? isVerbose,
  }) {
    return ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: fileSystemEntityIgnore ?? this.fileSystemEntityIgnore,
      isUseFileSystemEntityIgnore: isUseFileSystemEntityIgnore ?? this.isUseFileSystemEntityIgnore,
      isVerbose: isVerbose ?? this.isVerbose,
    );
  }

  static ArchiveGeneralLibOptions empty({
    String fileSystemEntityIgnore = "",
    bool isUseFileSystemEntityIgnore = true,
    bool isVerbose = false,
  }) {
    return ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: fileSystemEntityIgnore,
      isUseFileSystemEntityIgnore: isUseFileSystemEntityIgnore,
      isVerbose: isVerbose,
    );
  }
}

extension ArchiveGeneralLibExtensionFileSystemEntityToArchiveFile on FileSystemEntity {
  /// archive file
  ArchiveFile toArchiveFile({
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
  final Archive archive = Archive();

  /// ArchiveGeneralLib
  ArchiveGeneralLib();

  /// archive directory
  void addFilesByDirectory({
    required Directory directory,
    required Directory directoryBase,
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final List<String> fileSystemEntityIgnores = (archiveGeneralLibOptions.isUseFileSystemEntityIgnore) ? archiveGeneralLibOptions.fileSystemEntityIgnore.toGlob() : [];
    if (archiveGeneralLibOptions.isUseFileSystemEntityIgnore) {
      for (final element in FileSystemEntityIgnore.getFileIgnoresByDirectory(currentPath: directory.uri.toFilePath())) {
        if (fileSystemEntityIgnores.contains(element) == false) {
          fileSystemEntityIgnores.add(element);
        }
      }
    }
    final List<RegExp> fileSystemEntityIgnoresRegexp = fileSystemEntityIgnores.map((e) => RegExp(e)).toList();

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
          name: path_package.relative(element.uri.toFilePath(), from: directoryBase.uri.toFilePath()),
        );
      }
    }
    fileSystemEntityIgnores.clear();
    fileSystemEntityIgnoresRegexp.clear();
  }

  /// add any file
  void addFile({
    required FileSystemEntity fileSystemEntity,
    required String name,
  }) {
    archive.addFile(fileSystemEntity.toArchiveFile(
      name: name,
    ));
    return;
  }

  /// archive to zip bytes
  List<int>? toZipBytes({
    required String? password,
    int level = DeflateLevel.bestSpeed,
    OutputStream? output,
    DateTime? modified,
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
    required String path,
    required String? password,
    required bool verify,
  }) {
    final ZipDecoder zipDecoder = ZipDecoder();
    return zipDecoder.decodeStream(InputFileStream(path), password: password, verify: verify);
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
    required Directory directory,
    required String? password,
    required File outPutFile,
    DateTime? modified,
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
    required Directory directory,
    required String? password,
    required File outPutFile,
    DateTime? modified,
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
    required File archivedFile,
    required Directory directoryOutput,
    required String? password,
    required bool verify,
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
    required File archivedFile,
    required Directory directoryOutput,
    required String? password,
    bool verify = true,
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
