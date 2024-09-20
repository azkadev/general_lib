import 'package:general_lib/archive/archive.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  print("start");
  File file_archived = File(path.join(Directory.current.path, "temp", "slebew.zip"));
  Directory directory_output = Directory(path.join(Directory.current.path, "temp", "azka"));
  String? password;
  if (directory_output.existsSync()) {
    directory_output.deleteSync(recursive: true);
  }
  await ArchiveGeneralLib.createArchiveZipAsync(
    directory: Directory(path.join(Directory.current.path)),
    password: password,
    outPutFile: file_archived,
    archiveGeneralLibOptions: ArchiveGeneralLibOptions(
      fileSystemEntityIgnore: "",
      isVerbose: false,
    ),
  );
  print("extract");
  await ArchiveGeneralLib.extractArchiveZipAsync(
    archivedFile: file_archived,
    directoryOutput: directory_output,
    password: password,
    verify: true,
    archiveGeneralLibOptions: ArchiveGeneralLibOptions(fileSystemEntityIgnore: "", isVerbose: false),
  );
  print("done");
}
