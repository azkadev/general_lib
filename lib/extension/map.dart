// ignore_for_file: empty_catches

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

import "package:general_lib/json_scheme/json_scheme.dart";

import "list.dart" as listext;
import "regexp.dart" as regexp;

extension GeneralLibExtensionMap on Map {
  Map clone() {
    Map jsonData = {};
    forEach((key, value) {
      if (value is Map) {
        jsonData[key] = value.clone();
      } else if (value is List) {
        jsonData[key] = value.clone();
      } else {
        jsonData[key] = value;
      }
    });
    return jsonData;
  }

  bool hashNewData(Map data) {
    bool is_new_data = false;

    for (var element in data.entries) {
      // check dulu apakah ada kunci yang tidak sama jika tidak ada langsung break agar irit cpu
      if (containsKey(element.key) == false) {
        is_new_data = true;
        break;
      }
      // check new data
      dynamic value = element.value;

      if (value is Map) {
        if (this[element.key] is Map) {
          is_new_data = (this[element.key] as Map).hashNewData(value);
          if (is_new_data) {
            break;
          }
        } else {
          is_new_data = true;
          break;
        }
      } else if (value is List) {
        if (this[element.key] is List) {
          is_new_data = (this[element.key] as List).hashNewData(value);
          if (is_new_data) {
            break;
          }
        } else {
          is_new_data = true;
          break;
        }
      } else if (value != this[element.key]) {
        is_new_data = true;
        break;
      }
    }

    return is_new_data;
  }

  bool hashData(Map data) {
    int count_valid = 0;
    int count_data_same = 0;
    void countValid(Map data_origin) {
      data_origin.forEach((key, value) {
        if (value is Map) {
        } else if (value is List) {
          count_valid++;
        } else {
          count_valid++;
        }
      });
    }

    data.forEach((key, value) {
      if (value is Map) {
        countValid(value);
      } else if (value is List) {
        count_valid++;
      } else {
        count_valid++;
      }
    });

    void countSame(Map data_origin, Map data_old) {
      data_origin.forEach((key, value) {
        if (!data_origin.containsKey(key)) {
          return;
        }
        dynamic value_origin = data_origin[key];
        if (value is RegExp) {
          if (value.hashData(value_origin)) {
            count_data_same++;
          }
        } else if (value is Map) {
          if (value_origin is Map) {
            countSame(value, value_origin);
          }
        } else if (value is List) {
          if (value_origin is List) {
            if (value_origin.hashData(value)) {
              count_data_same++;
            }
          }
        } else {
          if (value_origin == value) {
            count_data_same++;
          }
        }
      });
    }

    data.forEach((key, value) {
      if (!containsKey(key)) {
        return;
      }
      dynamic value_origin = this[key];
      if (value is RegExp) {
        if (value.hashData(value_origin)) {
          count_data_same++;
        }
      } else if (value is Map) {
        if (value_origin is Map) {
          countSame(value, value_origin);
        }
      } else if (value is List) {
        if (value_origin is List) {
          if (value_origin.hashData(value)) {
            count_data_same++;
          }
        }
      } else {
        if (value_origin == value) {
          count_data_same++;
        }
      }
    });

    if (count_valid == 0) {
      return false;
    }
    return (count_valid == count_data_same);
  }

  Map<T, K> removeValueNull<T, K>() {
    forEach((key, value) {
      if (value == null) {
        remove(key);
      }
    });
    return cast<T, K>();
  }

  Map<T, K> filterByKeys<T, K>({
    required List<String> keys,
    bool isAllowValueNull = true,
  }) {
    Map<T, K> jsonData = {};

    forEach((key, value) {
      if (keys.contains(key)) {
        if (isAllowValueNull) {
          jsonData[key] = value;
        } else {
          if (value != null) {
            jsonData[key] = value;
          }
        }
      }
    });
    return jsonData;
  }

  Map<T, K> filterByKeysFromMapKeys<T, K>({
    required Map<String, dynamic> keys,
    bool isAllowValueNull = true,
  }) {
    return filterByKeys<T, K>(
      keys: keys.keys.toList(),
      isAllowValueNull: isAllowValueNull,
    );
  }

  void removeByKeys(List<String> keys, {bool isAllowValueNull = true}) {
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      if (keys.contains(key)) {
        remove(key);
      }
    }
  }

  void utils_set_datas_void(List datas, dynamic value) {
    dynamic state_data = this;
    for (var index = 0; index < datas.length; index++) {
      dynamic data_key = datas[index];
      if (state_data[data_key] is Map == false) {
        state_data[data_key] = {};
      }
      if (index == datas.length - 1) {
        state_data[data_key] = value;
      }
      state_data = state_data[data_key];
    }
    return;
  }

  void utils_set_data_void(String data, dynamic value) {
    utils_set_datas_void(data.split("."), value);
    return;
  }

  Map utils_set_datas(List datas, value) {
    utils_set_datas_void(datas, value);
    return this;
  }

  Map utils_set_data(dynamic data, value) {
    utils_set_data_void(data, value);
    return this;
  }

  void general_lib_utils_updateMapIfNotSameOrEmptyOrNull({
    required Map data,
    required List<String> ignoreKeys,
  }) {
    data.general_lib_utils_removeRecursiveByKeys(keyDatas: ignoreKeys);
    data.forEach((key, value) {
      if (ignoreKeys.contains(key)) {
        return;
      }
      try {
        // jika tidak ada key
        if (!containsKey(key)) {
          this[key] = value;
          return;
        }

        // jika ada value
        if (this[key] == null) {
          this[key] = value;
        } else if (value is Map && this[key] is Map) {
          (this[key] as Map).general_lib_utils_updateMapIfNotSameOrEmptyOrNull(
              data: value, ignoreKeys: ignoreKeys);
        } else if (value is List && this[key] is List) {
          if (value is List<Map> && this[key] is List<Map>) {}
        }
      } catch (e) {}
    });
    return;
  }

  void general_lib_utils_updateMapWithReplace({
    required Map data,
    required List<String> ignoreKeys,
  }) {
    data.general_lib_utils_removeRecursiveByKeys(keyDatas: ignoreKeys);
    data.forEach((key, value) {
      if (ignoreKeys.contains(key)) {
        return;
      }
      try {
        if (value == null) {
          return;
        }
        if (value is String) {
          if (value.isEmpty) {
            return;
          }
        }
        if (value is Map && this[key] is Map) {
          (this[key] as Map).general_lib_utils_updateMapWithReplace(
              data: value, ignoreKeys: ignoreKeys);
        } else if (value is List && this[key] is List) {
          if (value is List<Map> && this[key] is List<Map>) {}
        } else {
          this[key] = value;
        }
      } catch (e) {}
    });
    return;
  }

  void general_lib_utils_removeRecursiveByKeys({
    required List<String> keyDatas,
  }) {
    removeWhere((key, value) {
      if (keyDatas.contains(key)) {
        return true;
      }

      if (value is Map) {
        value.general_lib_utils_removeRecursiveByKeys(keyDatas: keyDatas);
      } else if (value is JsonScheme) {
        value.rawData
            .general_lib_utils_removeRecursiveByKeys(keyDatas: keyDatas);
      }

      if (value is List<Map>) {
        for (var element in value) {
          element.general_lib_utils_removeRecursiveByKeys(keyDatas: keyDatas);
        }
      } else if (value is List<JsonScheme>) {
        for (var element in value) {
          element.rawData
              .general_lib_utils_removeRecursiveByKeys(keyDatas: keyDatas);
        }
      }

      return false;
    });
  }

  void general_lib_utils_removeRecursiveValueNullOrEmpty() {
    removeWhere((key, value) {
      if (value == null) {
        return true;
      }

      if (value is String && value.isEmpty) {
        return true;
      }
      if (value is List && value.isEmpty) {
        return true;
      }
      if (value is Map && value.isEmpty) {
        return true;
      }
      if (value is List && value.isEmpty) {
        return true;
      }

      if (value is Map) {
        if (value.isEmpty) {
          return false;
        } else {
          value.general_lib_utils_removeRecursiveValueNullOrEmpty();
        }
      } else if (value is JsonScheme) {
        if (value.rawData.isEmpty) {
          return true;
        } else {
          value.rawData.general_lib_utils_removeRecursiveValueNullOrEmpty();
        }
      }
      if (value is List) {
        if (value.isEmpty) {
          return true;
        } else {
          if (value is List<Map>) {
            for (var element in value) {
              element.general_lib_utils_removeRecursiveValueNullOrEmpty();
            }
          } else if (value is List<JsonScheme>) {
            for (var element in value) {
              element.rawData
                  .general_lib_utils_removeRecursiveValueNullOrEmpty();
            }
          }
        }
      }
      return false;
    });
  }
}
