// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:general_lib/crypto/crypto.dart';
import 'package:general_lib/database/minimalist/core/builder.dart';
import 'package:general_lib/database/minimalist/core/type.dart';
import 'package:general_lib/extension/map.dart';

abstract class DatabaseMinimalistGeneralLibraryBaseAbstract {
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

class DatabaseMinimalistGeneralLibraryBaseOptions {
  final Crypto crypto;
  final bool isEncrypt;
  final bool isIgnoreError;

  DatabaseMinimalistGeneralLibraryBaseOptions({
    required this.crypto,
    required this.isEncrypt,
    required this.isIgnoreError,
  });
}

abstract class DatabaseMinimalistGeneralLibraryBase implements DatabaseMinimalistGeneralLibraryBaseAbstract {
  late final String pathToFile;
  late final DatabaseMinimalistGeneralLibraryBaseOptions databaseMinimalistGeneralLibraryBaseOptions;
  bool isEnsureInitialized = false;
  Map<dynamic, dynamic> stateData = <dynamic, dynamic>{};
  Map<dynamic, dynamic> defaultData = const <dynamic, dynamic>{};

  DatabaseMinimalistGeneralLibraryBase();

  void ensureInitialized({
    required String pathToFile,
    required DatabaseMinimalistGeneralLibraryBaseOptions databaseMinimalistGeneralLibraryBaseOptions,
  }) {
    if (isEnsureInitialized) {
      return;
    }
    this.pathToFile = pathToFile;
    this.databaseMinimalistGeneralLibraryBaseOptions = databaseMinimalistGeneralLibraryBaseOptions;

    isEnsureInitialized = true;
  }

  void initiaLizedSync({
    Map<dynamic, dynamic> defaultData = const {},
  }) {
    stateData.clear();
    try {
      stateData = json.decode(decrypt(data_base64: readSync(), isIgnoreError: databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError));
    } catch (e) {
      if (databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError == false) {
        rethrow;
      }
    }
    this.defaultData = defaultData;
    setDaultData(defaultData: this.defaultData);
  }

  Future<void> initiaLized({
    Map<dynamic, dynamic> defaultData = const {},
  }) async {
    stateData.clear();
    try {
      stateData = json.decode(decrypt(data_base64: await readAsync(), isIgnoreError: databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError));
    } catch (e) {
      if (databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError == false) {
        rethrow;
      }
    }
    this.defaultData = defaultData;
    setDaultData(defaultData: this.defaultData);
  }

  void reset() {
    stateData.clear();
    stateData = defaultData;
  }

  void setDaultData({
    required Map<dynamic, dynamic> defaultData,
  }) {
    stateData.general_lib_utils_updateIfNotSameTypeOrEmpty(
      data: defaultData,
      ignoreKeys: [],
    );
  }

  String encrypt({
    required Map data,
    required bool isIgnoreError,
  }) {
    try {
      return databaseMinimalistGeneralLibraryBaseOptions.crypto.encrypt(data: json.encode(data));
    } catch (e) {
      if (isIgnoreError == false) {
        rethrow;
      }
      return "";
    }
  }

  String decrypt({
    required String data_base64,
    required bool isIgnoreError,
  }) {
    try {
      return databaseMinimalistGeneralLibraryBaseOptions.crypto.decrypt(data_base64: data_base64);
    } catch (e) {
      if (isIgnoreError == false) {
        rethrow;
      }
      return json.encode({});
    }
  }

  T valueBuilder<T>({
    required T Function(DatabaseMinimalistGeneralLibraryBase db) builder,
  }) {
    return builder(this);
  }
  FutureOr<T> valueBuilderAsync<T>({
    required FutureOr<T> Function(DatabaseMinimalistGeneralLibraryBase db) builder,
  }) async{
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

  DatabaseMinimalistGeneralLibraryBuilder<T> get<T>({
    required String key,
  }) {
    final DatabaseMinimalistGeneralLibraryBuilder<T> databaseMinimalistGeneralLibraryBuilder = DatabaseMinimalistGeneralLibraryBuilder<T>(
      db: this,
    );
    databaseMinimalistGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: null,
      databaseMinimalistGeneralLibraryMethodType: DatabaseMinimalistGeneralLibraryMethodType.getDatabase,
    );
    return databaseMinimalistGeneralLibraryBuilder;
  }

  DatabaseMinimalistGeneralLibraryBuilder<bool> set<bool>({
    required String key,
    required Object? value,
  }) {
    final DatabaseMinimalistGeneralLibraryBuilder<bool> databaseMinimalistGeneralLibraryBuilder = DatabaseMinimalistGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMinimalistGeneralLibraryBuilder.ensureInitialized(
      key: key,
      value: value,
      databaseMinimalistGeneralLibraryMethodType: DatabaseMinimalistGeneralLibraryMethodType.setDatabase,
    );
    return databaseMinimalistGeneralLibraryBuilder;
  }

  DatabaseMinimalistGeneralLibraryBuilder<bool> write<bool>() {
    final DatabaseMinimalistGeneralLibraryBuilder<bool> databaseMinimalistGeneralLibraryBuilder = DatabaseMinimalistGeneralLibraryBuilder<bool>(
      db: this,
    );
    databaseMinimalistGeneralLibraryBuilder.ensureInitialized(
      key: "",
      value: null,
      databaseMinimalistGeneralLibraryMethodType: DatabaseMinimalistGeneralLibraryMethodType.writeDatabase,
    );
    return databaseMinimalistGeneralLibraryBuilder;
  }
}
