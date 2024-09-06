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
  Map<dynamic, dynamic> defaultData = const <dynamic, dynamic>{};

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
    Map<dynamic, dynamic> defaultData = const {},
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
    this.defaultData = defaultData;
    setDefaultData(defaultData: this.defaultData);
    isInitialized = true;
  }

  Future<void> initiaLized({
    Map<dynamic, dynamic> defaultData = const {},
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
    this.defaultData = defaultData;
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
}
