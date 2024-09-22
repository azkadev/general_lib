import 'package:general_lib/general_lib.dart';
import 'package:general_lib/schemes/schemes.dart';
import "package:path/path.dart" as path;
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  print("start");
  Directory directory_lib_scheme = Directory(path.join(Directory.current.uri.toFilePath(), "lib", "scheme"));
  if (directory_lib_scheme.existsSync()) {
    directory_lib_scheme.deleteSync(recursive: true);
  }
  directory_lib_scheme.createSync(recursive: true);
  await jsonToScripts(schemes, directory: directory_lib_scheme);
  print("done");
  exit(0);
}
