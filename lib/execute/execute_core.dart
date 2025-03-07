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
// ignore_for_file: empty_catches, non_constant_identifier_names

import 'dart:async';

/// GeneralLib
typedef ExecuteOnErrorDart<V> = FutureOr<V> Function(
    Object error, StackTrace stackTrace);

/// GeneralLib
extension GeneralLibFutureOrExecuteExtensions<T> on FutureOr<T> {
  /// GeneralLib
  FutureOr<T> general_lib_execute({
    Duration? timeLimit,
    FutureOr<T> Function()? onTimeout,
    required FutureOr<T> Function() onNullData,
    ExecuteOnErrorDart<T>? onError,
    bool isThrowOnError = true,
  }) async {
    return (await general_lib_execute_or_null(
          timeLimit: timeLimit,
          onTimeout: onTimeout,
          onError: onError,
          isThrowOnError: isThrowOnError,
        )) ??
        await onNullData();
  }

  /// GeneralLib
  FutureOr<T?> general_lib_execute_or_null({
    Duration? timeLimit,
    FutureOr<T> Function()? onTimeout,
    ExecuteOnErrorDart<T>? onError,
    bool isThrowOnError = true,
  }) async {
    try {
      FutureOr<T> data = this;
      if (data is Future<T>) {
        if (timeLimit != null) {
          return await data.timeout(timeLimit, onTimeout: onTimeout);
        }
        return await data;
      }
      return data;
    } catch (e, stack) {
      if (isThrowOnError) {
        rethrow;
      }
      ExecuteOnErrorDart<T>? on_error_function = onError;
      if (on_error_function != null) {
        return await on_error_function(e, stack);
      }
    }
    return null;
  }
}
