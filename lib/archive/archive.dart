import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:general_lib/file_system_entity/file_system_entity.dart';
import 'package:general_lib/glob/glob.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path_package;

class ArchiveGeneralLibOptions {
  final String fileSystemEntityIgnore;
  final bool isVerbose;
  ArchiveGeneralLibOptions({
    required this.fileSystemEntityIgnore,
    required this.isVerbose,
  });

  ArchiveGeneralLibOptions copyWith({
    String? fileSystemEntityIgnore,
    bool? isVerbose,
  }) {
    return ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: fileSystemEntityIgnore ?? this.fileSystemEntityIgnore,
      isVerbose: isVerbose ?? this.isVerbose,
    );
  }
}

extension Saaslpalsp on FileSystemEntity {
  ArchiveFile toArchiveFile({
    required String name,
  }) {
    return ArchiveFile.stream(name, statSync().size, InputFileStream(path));
  }
}

class ArchiveGeneralLib {
  final Archive archive = Archive();

  final ArchiveGeneralLibOptions archiveGeneralLibOptions;
  ArchiveGeneralLib({
    required this.archiveGeneralLibOptions,
  });

  void addFilesByDirectory({
    required Directory directory,
    required Directory directoryBase,
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final List<String> fileSystemEntityIgnores = archiveGeneralLibOptions.fileSystemEntityIgnore.toGlob();
    for (final element in FileSystemEntityIgnore.getFileIgnoresByDirectory(currentPath: directory.uri.toFilePath())) {
      if (fileSystemEntityIgnores.contains(element) == false) {
        fileSystemEntityIgnores.add(element);
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
  }

  void addFile({
    required FileSystemEntity fileSystemEntity,
    required String name,
  }) {
    archive.addFile(fileSystemEntity.toArchiveFile(
      name: name,
    ));
    return;
  }

  List<int>? toZipBytes({
    required String? password,
    int level = Deflate.DEFAULT_COMPRESSION,
    OutputStreamBase? output,
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

  static File createArchiveZip({
    required Directory directory,
    required String? password,
    required File outPutFile,
    DateTime? modified,
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib(
      archiveGeneralLibOptions: archiveGeneralLibOptions,
    );
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
    archiveGeneralLib.archive.clearSync();

    return outPutFile;
  }
}
