import 'core/base.dart';

class DatabaseMinimalistGeneralLibrary extends DatabaseMinimalistGeneralLibraryBase {
  DatabaseMinimalistGeneralLibrary();

  @override
  Future<String> readAsync() async {
    return "";
  }

  @override
  String readSync() {
    return "";
  }

  @override
  Future<void> writeAsync({required String content}) async {
    return;
  }

  @override
  void writeSync({required String content}) {
    return;
  }

  @override
  String platformName() {
    return "none";
  }
}
