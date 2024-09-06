// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:mirrors';

import 'type.dart';
import 'package:general_lib/extension/map.dart';
import 'package:general_lib/json_scheme/json_scheme.dart';
import 'base.dart';

class DatabaseMinimalistGeneralLibraryBuilder<T> implements Future<T> {
  String state_key = "";
  Object? state_value = "";
  DatabaseMinimalistGeneralLibraryMethodType databaseMinimalistGeneralLibraryMethodType = DatabaseMinimalistGeneralLibraryMethodType.unknown;
  final DatabaseMinimalistGeneralLibraryBase db;
  DatabaseMinimalistGeneralLibraryBuilder({
    required this.db,
  });

  void ensureInitialized({
    required String key,
    required Object? value,
    required DatabaseMinimalistGeneralLibraryMethodType databaseMinimalistGeneralLibraryMethodType,
  }) {
    this.state_key = key;
    this.state_value = value;
    this.databaseMinimalistGeneralLibraryMethodType = databaseMinimalistGeneralLibraryMethodType;
  }

  // @override
  T? sync() {
    if (databaseMinimalistGeneralLibraryMethodType == DatabaseMinimalistGeneralLibraryMethodType.writeDatabase) {
      db.writeSync(content: db.encrypt(data: db.stateData, isIgnoreError: db.databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError));
      return true as T;
    }

    return execute();
  }

  T? execute() {
    if (databaseMinimalistGeneralLibraryMethodType == DatabaseMinimalistGeneralLibraryMethodType.getDatabase) {
      final ClassMirror classMirror = reflectClass(T);
      if (classMirror.isAssignableTo(reflectType(JsonScheme))) {
        final T result = (classMirror.invoke(Symbol("empty"), []).reflectee as T);
        if (result is JsonScheme) {
          final Map? result_data = db.stateData.extension_general_lib_getData(key: state_key);
          if (result_data == null) {
            return null;
          }
          result.rawData = result_data;
        }
        return result;
      } else {
        final result_data = db.stateData.extension_general_lib_getData(key: state_key);
        if (result_data == null) {
          return null;
        }
        return result_data as T;
      }
    }

    if (databaseMinimalistGeneralLibraryMethodType == DatabaseMinimalistGeneralLibraryMethodType.setDatabase) {
      db.stateData.utils_set_data_void(state_key, state_value);
      return true as T;
    }

    throw UnimplementedError(databaseMinimalistGeneralLibraryMethodType.name);
  }

  // @override
  Future<T?> _execute() async {
    if (databaseMinimalistGeneralLibraryMethodType == DatabaseMinimalistGeneralLibraryMethodType.writeDatabase) {
      await db.writeAsync(content: db.encrypt(data: db.stateData, isIgnoreError: db.databaseMinimalistGeneralLibraryBaseOptions.isIgnoreError));
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
    if (onError != null && onError is! Function(Object, StackTrace) && onError is! Function(Object)) {
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
