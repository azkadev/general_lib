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

  ArchiveGeneralLib();

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

  Archive zipDecoder({
    required String path,
    required String? password,
    required bool verify,
  }) {
    final ZipDecoder zipDecoder = ZipDecoder();

    return zipDecoder.decodeBuffer(InputFileStream(path), password: password, verify: verify);
  }

  void close() {
    archive.clearSync();
  }

  Future<void> closeAsync() async {
    await archive.clear();
  }

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

  static Future<Directory> extractArchiveZipAsync({
    required File archivedFile,
    required Directory directoryOutput,
    required String? password,
    bool verify  = true,
    required ArchiveGeneralLibOptions archiveGeneralLibOptions,
  }) async {
    final ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
    await extractArchiveToDiskAsync(
      archiveGeneralLib.zipDecoder(
        path: archivedFile.path,
        password: password,
        verify: verify,
      ),
      directoryOutput.uri.toFilePath(),
      asyncWrite: true,
    );
    await archiveGeneralLib.closeAsync(); 
    return directoryOutput;
  }
}
