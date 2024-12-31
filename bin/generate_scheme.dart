import 'package:general_lib/general_lib.dart';
import 'package:general_lib/schemes/schemes.dart';
import "package:path/path.dart" as path;
import 'package:io_universe/io_universe.dart';

void main(List<String> args) async {
  print("start");
  Directory directoryLibScheme =
      Directory(path.join(Directory.current.uri.toFilePath(), "lib", "scheme"));
  if (directoryLibScheme.existsSync()) {
    directoryLibScheme.deleteSync(recursive: true);
  }
  directoryLibScheme.createSync(recursive: true);
  await jsonToScripts(schemes, directory: directoryLibScheme);
  print("done");
  exit(0);
}
