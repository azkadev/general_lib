// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:general_lib/crypto/crypto.dart';
import 'package:general_lib/database/mini/core/builder.dart';
import 'package:general_lib/database/mini/core/type.dart';
import 'package:general_lib/extension/map.dart';

abstract class DatabaseMiniGeneralLibraryBaseAbstract {
  String platformName() {
    return "";
  }

  String readSync() {
    return "";
  }

  Future<String> readAsync() async {
    return "";
  }

  void writeSync({
    required String content,
  }) {
    return;
  }

  Future<void> writeAsync({
    required String content,
  }) async {
    return;
  }
}

class DatabaseMiniGeneralLibraryBaseOptions {
  final Crypto crypto;
  final bool isUseCrypto;
  final bool isIgnoreError;

  DatabaseMiniGeneralLibraryBaseOptions({
    required this.crypto,
    required this.isUseCrypto,
    required this.isIgnoreError,
  });
}

abstract class DatabaseMiniGeneralLibraryBase implements DatabaseMiniGeneralLibraryBaseAbstract {
  late final String pathToFile;
  late final DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions;
  bool isEnsureInitialized = false;

  bool isInitialized = false;

  Map<dynamic, dynamic> stateData = <dynamic, dynamic>{};
  Map<dynamic, dynamic> defaultData =  <dynamic, dynamic>{};

  DatabaseMiniGeneralLibraryBase();

  /// operator map data
  operator [](key) {
    return stateData[key];
  }

  /// operator map data
  void operator []=(key, value) {
    stateData[key] = value;
  }

  void ensureInitialized({
    required String pathToFile,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (isEnsureInitialized) {
      return;
    }
    this.pathToFile = pathToFile;
    this.databaseMiniGeneralLibraryBaseOptions = databaseMiniGeneralLibraryBaseOptions;
    isEnsureInitialized = true;
  }

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
          databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions,
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
          databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions,
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

  void reset() {
    stateData.clear();
    // stateData.addAll(defaultData);
    setDefaultData(defaultData: defaultData);
  }

  void setDefaultData({
    required Map<dynamic, dynamic> defaultData,
  }) {
    stateData.general_lib_utils_updateIfNotSameTypeOrEmpty(
      data: defaultData,
      ignoreKeys: [],
    );
  }

  String encrypt({
    required Map data,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (databaseMiniGeneralLibraryBaseOptions.isUseCrypto) {
      try {
        return databaseMiniGeneralLibraryBaseOptions.crypto.encrypt(data: json.encode(data));
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

  String decrypt({
    required String data_base64,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
  }) {
    if (databaseMiniGeneralLibraryBaseOptions.isUseCrypto) {
      try {
        return databaseMiniGeneralLibraryBaseOptions.crypto.decrypt(data_base64: data_base64);
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

  T valueBuilder<T>({
    required T Function(DatabaseMiniGeneralLibraryBase db) builder,
  }) {
    return builder(this);
  }

  FutureOr<T> valueBuilderAsync<T>({
    required FutureOr<T> Function(DatabaseMiniGeneralLibraryBase db) builder,
  }) async {
    return await builder(this);
  }

  Map<dynamic, dynamic> toMap() {
    return toJson();
  }

  Map<dynamic, dynamic> toJson() {
    return stateData;
  }

  @override
  String toString() {
    return json.encode(stateData);
  }

  DatabaseMiniGeneralLibraryBuilder<T> get<T>({
    required String key,
  }) {
    final DatabaseMiniGeneralLibraryBuilder<T> databaseMiniGeneralLibraryBuilder = DatabaseMiniGeneralLibraryBuilder<T>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: null,
      databaseMiniMethodType: DatabaseMiniMethodType.getDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

  DatabaseMiniGeneralLibraryBuilder<bool> set<bool>({
    required String key,
    required Object? value,
  }) {
    final DatabaseMiniGeneralLibraryBuilder<bool> databaseMiniGeneralLibraryBuilder = DatabaseMiniGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: value,
      databaseMiniMethodType: DatabaseMiniMethodType.setDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

  DatabaseMiniGeneralLibraryBuilder<bool> write<bool>() {
    final DatabaseMiniGeneralLibraryBuilder<bool> databaseMiniGeneralLibraryBuilder = DatabaseMiniGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMiniGeneralLibraryBuilder.ensureInitialized(
      key: "",
      value: null,
      databaseMiniMethodType: DatabaseMiniMethodType.writeDatabase,
    );
    return databaseMiniGeneralLibraryBuilder;
  }

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

  void addEntries(Iterable<MapEntry> newEntries) {
    stateData.addEntries(newEntries);
  }

  Map<RK, RV> cast<RK, RV>() {
    return stateData.cast<RK, RV>();
  }

  void clear() {
    stateData.clear();
    // TODO: implement clear
  }

  bool containsKey(Object? key) {
    return stateData.containsKey(key);
  }

  bool containsValue(Object? value) {
    return stateData.containsValue(value);
  }

  // TODO: implement entries
  Iterable<MapEntry> get entries => stateData.entries;

  void forEach(void Function(dynamic key, dynamic value) action) {
    stateData.forEach(action);
  }

  // TODO: implement isEmpty
  bool get isEmpty => stateData.isEmpty;

  // TODO: implement isNotEmpty
  bool get isNotEmpty => stateData.isNotEmpty;

  // TODO: implement keys
  Iterable get keys => stateData.keys;

  // TODO: implement length
  int get length => stateData.length;

  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(dynamic key, dynamic value) convert) {
    return stateData.map<K2, V2>(convert);
  }

  putIfAbsent(key, Function() ifAbsent) {
    return stateData.putIfAbsent(key, ifAbsent);
  }

  remove(Object? key) {
    return stateData.remove(key);
  }

  void removeWhere(bool Function(dynamic key, dynamic value) test) {
    return stateData.removeWhere(test);
  }

  update(key, Function(dynamic value) update, {Function()? ifAbsent}) {
    return stateData.update(key, update, ifAbsent: ifAbsent);
  }

  void updateAll(Function(dynamic key, dynamic value) update) {
    // TODO: implement updateAll
    return stateData.updateAll(update);
  }

  // TODO: implement values
  Iterable get values => stateData.values;

  ///
}
