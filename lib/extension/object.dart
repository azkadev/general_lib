// ignore_for_file: non_constant_identifier_names

import 'dart:async';
/// GeneralLib
extension ObjectOrNullGeneralLibExtension<T extends Object> on T? {
  /// GeneralLib
  FutureOr<T> extension_general_lib_builderAsync({
    required FutureOr<T> Function(T? value) onBuilder,
  }) async {
    return await onBuilder(this);
  }
/// GeneralLib
  T extension_general_lib_builderSync({
    required T Function(T? value) onBuilder,
  }) {
    return onBuilder(this);
  }
}
/// GeneralLib
extension ObjectGeneralLibExtension<T extends Object> on T {
  /// GeneralLib
  FutureOr<K> extension_general_lib_convertAsync<K extends Object?>({
    required FutureOr<K> Function(T value) onConvert,
  }) async {
    return await onConvert(this);
  }
/// GeneralLib
  K extension_general_lib_convertSync<K extends Object?>({
    required K Function(T value) onConvert,
  }) {
    return onConvert(this);
  }
}
