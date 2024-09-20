import 'package:general_lib/archive/archive.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

void main(List<String> args) {
  // ArchiveGeneralLib archiveGeneralLib = ArchiveGeneralLib();
  ArchiveGeneralLib.createArchiveZip(
    directory: Directory(path.join(Directory.current.path)),
    password: null,
    outPutFile: File(path.join(Directory.current.path, "temp", "slebew.zip")),
    archiveGeneralLibOptions: ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: "",
      isVerbose: false,
    ),
  );
}
