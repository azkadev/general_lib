// ignore_for_file: empty_catches

import 'dart:async';
import "dart:html" as dart_html;
import 'dart:indexed_db' as dart_indexed_db;

import 'core/base.dart';

enum _DatabaseIndexedOperationType {
  readwrite,
  readonly;
}

class DatabaseMiniGeneralLibrary extends DatabaseMiniGeneralLibraryBase {
  DatabaseMiniGeneralLibrary();

  static late final dart_indexed_db.IdbFactory _indexedDatabase;
  static bool _isInitializedIndexedDb = false;
  static bool _isSupportIndexedDb = false;
  void _initWeb() {
    if (DatabaseMiniGeneralLibrary._isInitializedIndexedDb) {
      return;
    }
    try {
      _indexedDatabase = dart_html.window.indexedDB!;
      _isSupportIndexedDb = true;
    } catch (e) {
      _isSupportIndexedDb = false;
    }
    DatabaseMiniGeneralLibrary._isInitializedIndexedDb = true;
  }

  bool _isInitializedDatabase = false;
  final Completer<bool> _completerOpenDatabase = Completer<bool>();
  late final dart_indexed_db.Database _database;
  Future<void> _openDatabase() async {
    if (_isSupportIndexedDb == false) {
      return;
    }
    if (_isInitializedDatabase) {
      return;
    }
    try {
      _database = await _indexedDatabase.open(
        pathToFile,
        version: 1,
        onUpgradeNeeded: (event) {
          try {
            final _db = event.target.result;
            // for (final name in boxNames) {
            _db.createObjectStore(pathToFile, autoIncrement: true);
          } catch (e) {}
          // }
        },
      );
    } catch (e) { 
    }
    _isInitializedDatabase = true;
    _completerOpenDatabase.complete(true);
  }

  @override
  void ensureInitialized({required String pathToFile, required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions}) {
    // TODO: implement ensureInitialized
    super.ensureInitialized(pathToFile: pathToFile, databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions);

    _initWeb();
    _openDatabase();
  }

  @override
  Future<String> readAsync() async { 
    if (await _completerOpenDatabase.future) {}
    if (_isInitializedDatabase) {
      { 
        final data = _database.transaction(pathToFile, _DatabaseIndexedOperationType.readonly.name);

        final ob = data.objectStore(pathToFile); 
        final result = await ob.getObject(pathToFile);
        if (result is String) {
          if (result.isEmpty) {
            return "{}";
          }
          return result;
        }
      }
    }
    return "";
  }

  @override
  String readSync() {
    return "";
  }

  @override
  Future<void> writeAsync({
    required String content,
  }) async {
    if (await _completerOpenDatabase.future) {}
    if (_isInitializedDatabase) {
      {
        final data = _database.transaction(pathToFile, _DatabaseIndexedOperationType.readwrite.name);
        final ob = data.objectStore(pathToFile);
        await ob.put(content, pathToFile);
      }
    }
    return;
  }

  @override
  void writeSync({
    required String content,
  }) {
    writeAsync(content: content);
    return;
  }

  @override
  String platformName() {
    return "web";
  }
}
