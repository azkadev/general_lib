// ignore_for_file: deprecated_member_use

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: empty_catches

import 'dart:async';

import "dart:html" as dart_html;
import 'dart:indexed_db' as dart_indexed_db;

import 'core/base.dart';

enum _DatabaseIndexedOperationType {
  readwrite,
  readonly;
}

/// GeneralLib
class DatabaseMiniGeneralLibrary extends DatabaseMiniGeneralLibraryBase {
  /// GeneralLib
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
            final db = event.target.result;
            // for (final name in boxNames) {
            db.createObjectStore(pathToFile, autoIncrement: true);
          } catch (e) {}
          // }
        },
      );
    } catch (e) {}
    _isInitializedDatabase = true;
    _completerOpenDatabase.complete(true);
  }

  @override
  void ensureInitialized(
      {required String pathToFile,
      required DatabaseMiniGeneralLibraryBaseOptions
          databaseMiniGeneralLibraryBaseOptions}) {
    super.ensureInitialized(
        pathToFile: pathToFile,
        databaseMiniGeneralLibraryBaseOptions:
            databaseMiniGeneralLibraryBaseOptions);

    _initWeb();
    _openDatabase();
  }

  @override
  Future<String> readAsync() async {
    if (await _completerOpenDatabase.future) {}
    if (_isInitializedDatabase) {
      {
        final data = _database.transaction(
            pathToFile, _DatabaseIndexedOperationType.readonly.name);

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
        final data = _database.transaction(
            pathToFile, _DatabaseIndexedOperationType.readwrite.name);
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
