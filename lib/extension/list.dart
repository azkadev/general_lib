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

import "dart:async";
import "dart:math";

import "map.dart" as mapext;
import "regexp.dart" as regexp;
/// GeneralLib
extension GeneralLibExtensionListExtension<T> on List<T> {
  /// GeneralLib
  Iterable<T> extensionGeneralLibForEach({
    required bool isReverse,
    required T Function(T data, int index, int totalLength, bool isReverse)
        onData,
  }) sync* {
    final int totalLength = length;
    if (isReverse) {
      for (int i = totalLength - 1; i >= 0; i--) {
        yield onData(this[i], i, totalLength, isReverse);
      }
    } else {
      for (int i = 0; i < totalLength; i++) {
        yield onData(this[i], i, totalLength, isReverse);
      }
    }
    return;
  }
/// GeneralLib
  Iterable<V> extensionGeneralLibMap<V>({
    required bool isReverse,
    required V Function(T data, int index, int totalLength, bool isReverse)
        onData,
  }) sync* {
    final int totalLength = length;
    if (isReverse) {
      for (int i = totalLength - 1; i >= 0; i--) {
        yield onData(this[i], i, totalLength, isReverse);
      }
    } else {
      for (int i = 0; i < totalLength; i++) {
        yield onData(this[i], i, totalLength, isReverse);
      }
    }
    return;
  }
}
/// GeneralLib
extension GeneralLibExtensionList on List {
  /// GeneralLib
  List<List<T>> createLimit<T>({
    required int limit,
  }) {
    List<List<T>> result = [];
    List<T> state_data = [];
    for (var i = 0; i < length; i++) {
      dynamic data_id = this[i];
      if (data_id is T == false) {
        continue;
      }
      if (state_data.length >= limit) {
        state_data.add(data_id);
        result.add(state_data);
        state_data = [];
      } else {
        state_data.add(data_id);
      }
    }
    if (state_data.isNotEmpty) {
      result.add(state_data);
      state_data = [];
    }
    return result;
  }
/// GeneralLib
  List<T> clone<T>() {
    List<T> jsonData = [];

    for (var i = 0; i < length; i++) {
      T data_loop = this[i];
      if (data_loop is Map) {
        jsonData.add(data_loop.clone() as T);
      } else if (data_loop is List) {
        jsonData.add(data_loop.clone() as T);
      } else {
        jsonData.add(data_loop);
      }
    }
    return jsonData;
  }/// GeneralLib

  bool hashNewData(List datas) {
    bool is_new_data = false;
    if (length != datas.length) {
      return true;
    }
    for (var value in datas) {
      if (value is Map) {
        for (var value_origin in this) {
          if (value_origin is Map) {
            // if (value_origin.hashData(value)) {
            is_new_data = value_origin.hashNewData(value);
            if (is_new_data) {
              break;
            }
            // }
          } else {
            is_new_data = true;
            break;
          }
        }
        if (is_new_data) {
          break;
        }
      } else if (value is List) {
        for (var value_origin in this) {
          if (value_origin is List) {
            // if (value_origin.hashData(value)) {
            is_new_data = value_origin.hashNewData(value);
            if (is_new_data) {
              break;
            }
            // }
          } else {
            is_new_data = true;
            break;
          }
        }
        if (is_new_data) {
          break;
        }
      } else if (contains(value) == false) {
        is_new_data = true;
        break;
      }
    }

    return is_new_data;
  }
/// GeneralLib
  bool hashData(List datas) {
    int count_valid = 0;
    int count_data_same = 0;

    void countValids(List data_origins) {
      for (var i = 0; i < data_origins.length; i++) {
        dynamic value = data_origins[i];
        if (value is Map) {
          count_valid++;
        } else if (value is List) {
          countValids(value);
        } else {
          count_valid++;
        }
      }
    }

    for (var i = 0; i < datas.length; i++) {
      dynamic value = datas[i];
      if (value is Map) {
        count_valid++;
      } else if (value is List) {
        countValids(value);
      } else {
        count_valid++;
      }
    }

    void countSame(List data_origin, List data_old) {
      int count_length = data_old.length;
      for (var i = 0; i < data_origin.length; i++) {
        if (i >= count_length) {
          continue;
        }
        dynamic value = datas[i];
        dynamic value_origin = data_origin[i];
        if (value is RegExp) {
          if (value.hashData(value_origin)) {
            count_data_same++;
          }
        } else if (value is Map) {
          if (value_origin is Map) {
            if (value_origin.hashData(value)) {
              count_data_same++;
            }
          }
        } else if (value is List) {
          if (value_origin is List) {
            countSame(value_origin, value);
          }
        } else {
          if (value_origin == value) {
            count_data_same++;
          }
        }
      }
    }

    int count_length = length;
    for (var i = 0; i < datas.length; i++) {
      if (i >= count_length) {
        continue;
      }
      dynamic value = datas[i];
      dynamic value_origin = this[i];
      if (value is RegExp) {
        if (value.hashData(value_origin)) {
          count_data_same++;
        }
      } else if (value is Map) {
        if (value_origin is Map) {
          if (value_origin.hashData(value)) {
            count_data_same++;
          }
        }
      } else if (value is List) {
        if (value_origin is List) {
          countSame(value_origin, value);
        }
      } else {
        if (value_origin == value) {
          count_data_same++;
        }
      }
    }

    if (count_valid == 0) {
      return false;
    }
    return (count_valid == count_data_same);
  }/// GeneralLib

  T? get<T>(dynamic data) {
    for (var index = 0; index < length; index++) {
      T data_origin = this[index];
      if (data is Map && data_origin is Map) {
        if (data_origin.hashData(data)) {
          return data_origin;
        }
      } else if (data is List && data_origin is List) {
        if (data_origin.hashData(data)) {
          return data_origin;
        }
      } else if (data == data_origin) {
        return data_origin;
      }
    }
    return null;
  }
/// GeneralLib
  List<T> gets<T>(dynamic data) {
    List<T> datas = [];
    for (var index = 0; index < length; index++) {
      T data_origin = this[index];
      if (data is Map && data_origin is Map) {
        if (data_origin.hashData(data)) {
          datas.add(data_origin);
        }
      } else if (data is List && data_origin is List) {
        if (data_origin.hashData(data)) {
          datas.add(data_origin);
        }
      } else if (data == data_origin) {
        datas.add(data_origin);
      }
    }
    return datas;
  }
/// GeneralLib
  List<T> cloneAndRandom<T>(List<T> array) {
    List<T> random_datas = [];
    for (var index = 0; index < array.length; index++) {
      random_datas.add(array[index]);
    }
    for (var index = 0; index < random_datas.length; index++) {
      random_datas.shuffle();
    }
    return random_datas;
  }
}/// GeneralLib

extension GeneralLibExtensionListd<T> on List<T> {
  /// sas
  T random({
    required T Function() onNotFound,
  }) {
    try {
      return this[Random().nextInt(length)];
    } catch (e) {
      return onNotFound();
    }
  }
/// GeneralLib
  Future<T> randomAsync({
    required FutureOr<T> Function() onNotFound,
  }) async {
    try {
      return this[Random().nextInt(length)];
    } catch (e) {
      return await onNotFound();
    }
  }/// GeneralLib

  T? randomOrNull() {
    try {
      return this[Random().nextInt(length)];
    } catch (e) {
      return null;
    }
  }
}
/// GeneralLib
extension GeneralLibRegExpExtensionList on List<RegExp> {
  /// GeneralLib
  bool hashData(dynamic input) {
    for (var i = 0; i < length; i++) {
      RegExp regExp = this[i];
      if (regExp.hashData(input)) {
        return true;
      }
    }
    return false;
  }
}
