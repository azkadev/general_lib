import 'package:general_lib/archive/archive.dart';
import 'package:io_universe/io_universe.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  print("start");
  File fileArchived = File(path.join(Directory.current.path, "temp", "slebew.zip"));
  Directory directoryOutput = Directory(path.join(Directory.current.path, "temp", "azka"));
  String? password;
  if (directoryOutput.existsSync()) {
    directoryOutput.deleteSync(recursive: true);
  }
  await ArchiveGeneralLib.createArchiveZipAsync(
    directory: Directory(path.join(Directory.current.path)),
    password: password,
    outPutFile: fileArchived,
    archiveGeneralLibOptions: ArchiveGeneralLibOptions.empty(),
  );
  print("extract");
  await ArchiveGeneralLib.extractArchiveZipAsync(
    archivedFile: fileArchived,
    directoryOutput: directoryOutput,
    password: password,
    verify: true,
    archiveGeneralLibOptions: ArchiveGeneralLibOptions.empty(),
  );
  print("done");
}
