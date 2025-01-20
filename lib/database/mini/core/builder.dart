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
// import 'dart:mirrors';

import 'type.dart';
import 'package:general_lib/extension/map.dart';
import 'package:general_lib/json_scheme/json_scheme.dart';
import 'base.dart';

/// GeneralLib
class DatabaseMiniGeneralLibraryBuilder<T> implements Future<T> {
  /// GeneralLib
  String state_key = "";

  /// GeneralLib
  Object? state_value = "";

  /// GeneralLib
  DatabaseMiniMethodType databaseMiniMethodType =
      DatabaseMiniMethodType.unknown;

  /// GeneralLib
  final DatabaseMiniGeneralLibraryBase db;

  /// GeneralLib
  DatabaseMiniGeneralLibraryBuilder({
    required this.db,
  });

  /// GeneralLib
  void ensureInitialized({
    required String key,
    required Object? value,
    required DatabaseMiniMethodType databaseMiniMethodType,
  }) {
    this.state_key = key;
    this.state_value = value;
    this.databaseMiniMethodType = databaseMiniMethodType;
  }

  /// GeneralLib
  T? sync() {
    if (databaseMiniMethodType == DatabaseMiniMethodType.writeDatabase) {
      db.writeSync(
        content: db.encrypt(
          data: db.stateData,
          databaseMiniGeneralLibraryBaseOptions:
              db.databaseMiniGeneralLibraryBaseOptions,
        ),
      );
      return true as T;
    }

    return execute();
  }

  /// GeneralLib
  T? execute() {
    if (databaseMiniMethodType == DatabaseMiniMethodType.getDatabase) {
      // unsupported
      // {
      //   final ClassMirror classMirror = reflectClass(T);
      //   if (classMirror.isAssignableTo(reflectType(JsonScheme))) {
      //     final T result = (classMirror.invoke(Symbol("empty"), []).reflectee as T);
      //     if (result is JsonScheme) {
      //       final Map? result_data = db.stateData.extension_general_lib_getData(key: state_key);
      //       if (result_data == null) {
      //         return null;
      //       }
      //       result.rawData = result_data;
      //     }
      //     return result;
      //   }
      // }
      {
        final result_data =
            db.stateData.extension_general_lib_getData(key: state_key);
        if (result_data == null) {
          return null;
        }
        return result_data as T;
      }
    }

    if (databaseMiniMethodType == DatabaseMiniMethodType.setDatabase) {
      db.stateData.utils_set_data_void(
        state_key,
        anyValueToWriteableJson(state_value),
      );
      return true as T;
    }

    throw UnimplementedError(databaseMiniMethodType.name);
  }

  /// GeneralLib
  dynamic anyValueToWriteableJson(dynamic value) {
    if (value is JsonScheme) {
      return value.toJson();
    } else if (value is List<JsonScheme>) {
      return value.toJson();
    } else if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    } else if (value is Enum) {
      return value.name;
    } else if (value is List<Enum>) {
      return value.map((e) => e.name).toList();
    } else if (value is Uri) {
      return value.toString();
    } else {
      return value;
    }
  }

  // @override
  Future<T?> _execute() async {
    if (databaseMiniMethodType == DatabaseMiniMethodType.writeDatabase) {
      await db.writeAsync(
        content: db.encrypt(
          data: db.stateData,
          databaseMiniGeneralLibraryBaseOptions:
              db.databaseMiniGeneralLibraryBaseOptions,
        ),
      );
      return true as T;
    }
    return execute();
  }

  @override
  Stream<T> asStream() {
    final controller = StreamController<T>.broadcast();

    then((value) {
      controller.add(value);
    }).catchError((Object error, StackTrace stack) {
      controller.addError(error, stack);
    }).whenComplete(() {
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future<T> catchError(Function onError, {bool Function(Object error)? test}) {
    return then((value) => value).catchError(onError, test: test);
  }

  @override
  Future<U> then<U>(
    FutureOr<U> Function(T value) onValue, {
    Function? onError,
  }) async {
    if (onError != null &&
        onError is! Function(Object, StackTrace) &&
        onError is! Function(Object)) {
      throw ArgumentError.value(
        onError,
        "onError",
        "Error handler must accept one Object or one Object and a StackTrace"
            " as arguments, and return a value of the returned future's type",
      );
    }

    try {
      final response = await _execute();
      return onValue(response as T);
    } catch (error, stack) {
      final FutureOr<U> result;
      if (onError != null) {
        if (onError is Function(Object, StackTrace)) {
          result = onError(error, stack);
        } else if (onError is Function(Object)) {
          result = onError(error);
        } else {
          throw ArgumentError.value(
            onError,
            "onError",
            "Error handler must accept one Object or one Object and a StackTrace"
                " as arguments, and return a value of the returned future's type",
          );
        }
        // Give better error messages if the result is not a valid
        // FutureOr<R>.
        try {
          return result;
        } on TypeError {
          throw ArgumentError(
              "The error handler of Future.then"
                  " must return a value of the returned future's type",
              "onError");
        }
      }
      rethrow;
    }
  }

  @override
  Future<T> timeout(Duration timeLimit, {FutureOr<T> Function()? onTimeout}) {
    return then((value) => value).timeout(timeLimit, onTimeout: onTimeout);
  }

  @override
  Future<T> whenComplete(FutureOr<void> Function() action) {
    return then(
      (v) {
        final f2 = action();
        if (f2 is Future) return f2.then((_) => v);
        return v;
      },
      onError: (Object e) {
        final f2 = action();
        if (f2 is Future) {
          return f2.then((_) {
            throw e;
          });
        }
        throw e;
      },
    );
  }
}
