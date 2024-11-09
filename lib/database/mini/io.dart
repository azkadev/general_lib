import 'package:universal_io/io.dart';

import 'core/base.dart';

class DatabaseMiniGeneralLibrary extends DatabaseMiniGeneralLibraryBase implements DatabaseMiniGeneralLibraryBaseAbstract {
  DatabaseMiniGeneralLibrary();

  File get _file {
    final File file = File(pathToFile);
    if (file.parent.existsSync() == false) {
      file.parent.createSync(recursive: true);
    }
    return file;
  }

  @override
  String readSync() {
    return _file.readAsStringSync();
  }

  @override
  Future<String> readAsync() async {
    return await _file.readAsString();
  }

  @override
  void writeSync({
    required String content,
  }) {
    _file.writeAsStringSync(content);
  }

  @override
  Future<void> writeAsync({
    required String content,
  }) async {
    await _file.writeAsString(content);
  }

  @override
  String platformName() {
    return "io";
  }
}
