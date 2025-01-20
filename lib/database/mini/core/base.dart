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
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:general_lib/crypto/crypto.dart';
import 'package:general_lib/database/mini/core/builder.dart';
import 'package:general_lib/database/mini/core/type.dart';
import 'package:general_lib/extension/map.dart';

/// GeneralLib
abstract class DatabaseMiniGeneralLibraryBaseAbstract {
  /// GeneralLib
  String platformName() {
    return "";
  }

  /// GeneralLib
  String readSync() {
    return "";
  }

  /// GeneralLib

  Future<String> readAsync() async {
    return "";
  }

  /// GeneralLib
  void writeSync({
    required String content,
  }) {
    return;
  }

  /// GeneralLib

  Future<void> writeAsync({
    required String content,
  }) async {
    return;
  }
}

/// GeneralLib
class DatabaseMiniGeneralLibraryBaseOptions {
  /// GeneralLib
  final Crypto crypto;

  /// GeneralLib

  final bool isUseCrypto;

  /// GeneralLib
  final bool isIgnoreError;

  /// GeneralLib

  DatabaseMiniGeneralLibraryBaseOptions({
    required this.crypto,
    required this.isUseCrypto,
    required this.isIgnoreError,
  });
}

/// GeneralLib
abstract class DatabaseMiniGeneralLibraryBase
    implements DatabaseMiniGeneralLibraryBaseAbstract {
  /// GeneralLib
  late final String pathToFile;

  /// GeneralLib
  late final DatabaseMiniGeneralLibraryBaseOptions
      databaseMiniGeneralLibraryBaseOptions;

  /// GeneralLib
  bool isEnsureInitialized = false;

  /// GeneralLib
  bool isInitialized = false;

  /// GeneralLib
  Map<dynamic, dynamic> stateData = <dynamic, dynamic>{};

  /// GeneralLib
  Map<dynamic, dynamic> defaultData = <dynamic, dynamic>{};

  /// GeneralLib
  DatabaseMiniGeneralLibraryBase();

  /// operator map data
  operator [](key) {
    return stateData[key];
  }

  /// operator map data
  void operator []=(key, value) {
    stateData[key] = value;
  }

  /// GeneralLib

  void ensureInitialized({
    required String pathToFile,
    required DatabaseMiniGeneralLibraryBaseOptions
        databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (isEnsureInitialized) {
      return;
    }
    this.pathToFile = pathToFile;
    this.databaseMiniGeneralLibraryBaseOptions =
        databaseMiniGeneralLibraryBaseOptions;
    isEnsureInitialized = true;
  }

  /// GeneralLib
  void initiaLizedSync({
    Map<dynamic, dynamic>? defaultData,
  }) {
    if (isInitialized) {
      return;
    }
    stateData.clear();
    try {
      setDefaultData(
        defaultData: json.decode(decrypt(
          data_base64: readSync(),
          databaseMiniGeneralLibraryBaseOptions:
              databaseMiniGeneralLibraryBaseOptions,
        )),
      );
    } catch (e) {
      if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
        rethrow;
      }
    }
    this.defaultData = defaultData ?? {};
    setDefaultData(defaultData: this.defaultData);
    isInitialized = true;
  }

  /// GeneralLib
  Future<void> initiaLized({
    Map<dynamic, dynamic>? defaultData,
  }) async {
    if (isInitialized) {
      return;
    }
    stateData.clear();
    try {
      setDefaultData(
        defaultData: json.decode(decrypt(
          data_base64: await readAsync(),
          databaseMiniGeneralLibraryBaseOptions:
              databaseMiniGeneralLibraryBaseOptions,
        )),
      );
    } catch (e) {
      if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
        rethrow;
      }
    }
    this.defaultData = defaultData ?? {};
    setDefaultData(defaultData: this.defaultData);
    isInitialized = true;
  }

  /// GeneralLib
  void reset() {
    stateData.clear();
    // stateData.addAll(defaultData);
    setDefaultData(defaultData: defaultData);
  }

  /// GeneralLib
  void setDefaultData({
    required Map<dynamic, dynamic> defaultData,
  }) {
    stateData.general_lib_utils_updateIfNotSameTypeOrEmpty(
      data: defaultData,
      ignoreKeys: [],
    );
  }

  /// GeneralLib
  String encrypt({
    required Map data,
    required DatabaseMiniGeneralLibraryBaseOptions
        databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (databaseMiniGeneralLibraryBaseOptions.isUseCrypto) {
      try {
        return databaseMiniGeneralLibraryBaseOptions.crypto
            .encrypt(data: json.encode(data));
      } catch (e) {
        if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
          rethrow;
        }
        return "";
      }
    } else {
      try {
        return json.encode(data);
      } catch (e) {
        if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
          rethrow;
        }
        return "";
      }
    }
  }

  /// GeneralLib
  String decrypt({
    required String data_base64,
    required DatabaseMiniGeneralLibraryBaseOptions
        databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (databaseMiniGeneralLibraryBaseOptions.isUseCrypto) {
      try {
        return databaseMiniGeneralLibraryBaseOptions.crypto
            .decrypt(data: data_base64);
      } catch (e) {
        if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
          rethrow;
        }
        return json.encode({});
      }
    } else {
      try {
        return data_base64;
      } catch (e) {
        if (databaseMiniGeneralLibraryBaseOptions.isIgnoreError == false) {
          rethrow;
        }
        return json.encode({});
      }
    }
  }

  /// GeneralLib

  T valueBuilder<T>({
    required T Function(DatabaseMiniGeneralLibraryBase db) builder,
  }) {
    return builder(this);
  }

  /// GeneralLib

  FutureOr<T> valueBuilderAsync<T>({
    required FutureOr<T> Function(DatabaseMiniGeneralLibraryBase db) builder,
  }) async {
    return await builder(this);
  }

  /// GeneralLib

  Map<dynamic, dynamic> toMap() {
    return toJson();
  }

  /// GeneralLib

  Map<dynamic, dynamic> toJson() {
    return stateData;
  }

  @override
  String toString() {
    return json.encode(stateData);
  }

  /// GeneralLib
  DatabaseMiniGeneralLibraryBuilder<T> get<T>({
    required String key,
  }) {
    final DatabaseMiniGeneralLibraryBuilder<T>
        databaseMiniGeneralLibraryBuilder =
        DatabaseMiniGeneralLibraryBuilder<T>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: null,
      databaseMiniMethodType: DatabaseMiniMethodType.getDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

  /// GeneralLib
  DatabaseMiniGeneralLibraryBuilder<bool> set<bool>({
    required String key,
    required Object? value,
  }) {
    final DatabaseMiniGeneralLibraryBuilder<bool>
        databaseMiniGeneralLibraryBuilder =
        DatabaseMiniGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: value,
      databaseMiniMethodType: DatabaseMiniMethodType.setDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

  /// GeneralLib
  DatabaseMiniGeneralLibraryBuilder<bool> write<bool>() {
    final DatabaseMiniGeneralLibraryBuilder<bool>
        databaseMiniGeneralLibraryBuilder =
        DatabaseMiniGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: "",
      value: null,
      databaseMiniMethodType: DatabaseMiniMethodType.writeDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

  /// GeneralLib
  void close() {
    stateData.clear();
    defaultData.clear();
    return;
  }

  /// map extension
  ///
  ///

  void addAll(Map other) {
    stateData.addAll(other);
  }

  /// GeneralLib
  void addEntries(Iterable<MapEntry> newEntries) {
    stateData.addEntries(newEntries);
  }

  /// GeneralLib
  Map<RK, RV> cast<RK, RV>() {
    return stateData.cast<RK, RV>();
  }

  /// GeneralLib
  void clear() {
    stateData.clear();

    /// GeneralLib clear
  }

  /// GeneralLib
  bool containsKey(Object? key) {
    return stateData.containsKey(key);
  }

  /// GeneralLib
  bool containsValue(Object? value) {
    return stateData.containsValue(value);
  }

  /// GeneralLib entries
  Iterable<MapEntry> get entries => stateData.entries;

  /// GeneralLib
  void forEach(void Function(dynamic key, dynamic value) action) {
    stateData.forEach(action);
  }

  /// GeneralLib isEmpty
  bool get isEmpty => stateData.isEmpty;

  /// GeneralLib isNotEmpty
  bool get isNotEmpty => stateData.isNotEmpty;

  /// GeneralLib keys
  //
  /// GeneralLib
  Iterable get keys => stateData.keys;

  /// GeneralLib length

  /// GeneralLib
  int get length => stateData.length;

  /// GeneralLib
  Map<K2, V2> map<K2, V2>(
      MapEntry<K2, V2> Function(dynamic key, dynamic value) convert) {
    return stateData.map<K2, V2>(convert);
  }

  /// GeneralLib

  putIfAbsent(key, Function() ifAbsent) {
    return stateData.putIfAbsent(key, ifAbsent);
  }

  /// GeneralLib
  remove(Object? key) {
    return stateData.remove(key);
  }

  /// GeneralLib
  void removeWhere(bool Function(dynamic key, dynamic value) test) {
    return stateData.removeWhere(test);
  }

  /// GeneralLib
  update(key, Function(dynamic value) update, {Function()? ifAbsent}) {
    return stateData.update(key, update, ifAbsent: ifAbsent);
  }

  /// GeneralLib
  void updateAll(Function(dynamic key, dynamic value) update) {
    /// GeneralLib updateAll
    return stateData.updateAll(update);
  }

  /// GeneralLib values

  /// GeneralLib
  Iterable get values => stateData.values;

  ///
}
