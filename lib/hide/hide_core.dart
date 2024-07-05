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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';

import 'package:general_lib/extension/regexp.dart';

enum HideDataType {
  obfuscate,
  replace,
}

class HideRegExp {
  final RegExp regExp;
  final String replace;
  final HideDataType hideDataType;
  final int startIndexObfuscate;
  final int endIndexObfuscate;
  HideRegExp({
    required this.regExp,
    required this.replace,
    this.hideDataType = HideDataType.replace,
    this.startIndexObfuscate = 5,
    this.endIndexObfuscate = 5,
  });
}

class Hide {
  Hide();

  String obfocustData({
    required String mystring,
    int start = 5,
    int end = 5,
  }) {
    String message = "";
    int num_start = start;
    int num_end = mystring.length - end;
    if (num_end < 1) {
      num_end = mystring.length - 2;
    }
    for (int i = 0; i < mystring.length; i++) {
      var loop_data = mystring[i];
      if (i == num_end) {
        num_end--;
        message += loop_data;
      } else if (i == num_start) {
        num_start++;
        message += "*";
      } else {
        message += loop_data;
      }
    }
    return message;
  }

  String hideData({
    required String data,
    required List<HideRegExp> hideRegExps,
    bool ignoreError = false,
  }) {
    for (var i = 0; i < hideRegExps.length; i++) {
      try {
        HideRegExp hideRegExp = hideRegExps[i];
        if (hideRegExp.regExp.hashData(data)) {
          if (hideRegExp.hideDataType == HideDataType.replace) {
            data = data.replaceAll(hideRegExp.regExp, hideRegExp.replace);
          }
          if (hideRegExp.hideDataType == HideDataType.obfuscate) {
            data = obfocustData(
              mystring: data,
              start: hideRegExp.startIndexObfuscate,
              end: hideRegExp.endIndexObfuscate,
            );
          }
        }
      } catch (e) {
        if (ignoreError) {
          continue;
        } else {
          rethrow;
        }
      }
    }
    return data;
  }

  List<dynamic> cloneRecuriveList({
    required List data,
    required List<HideRegExp> hideRegExps,
    bool ignoreError = false,
  }) {
    List<dynamic> newData = [];

    for (var index = 0; index < data.length; index++) {
      //
      //
      dynamic loop_data = data[index];
      try {
        if (loop_data is Map || loop_data is List) {
          if (loop_data is Map) {
            newData.add(cloneRecuriveMap(
                data: loop_data,
                hideRegExps: hideRegExps,
                ignoreError: ignoreError));
          } else if (loop_data is List) {
            newData.add(cloneRecuriveList(
                data: loop_data,
                hideRegExps: hideRegExps,
                ignoreError: ignoreError));
          }
        } else if (loop_data is String) {
          newData.add(hideData(
              data: loop_data,
              hideRegExps: hideRegExps,
              ignoreError: ignoreError));
        } else if (loop_data is int) {
          newData.add(int.parse(hideData(
              data: "${loop_data}",
              hideRegExps: hideRegExps,
              ignoreError: ignoreError)));
        } else if (loop_data is double) {
          newData.add(double.parse(hideData(
              data: "${loop_data}",
              hideRegExps: hideRegExps,
              ignoreError: ignoreError)));
        } else if (loop_data is num) {
          newData.add(num.parse(hideData(
              data: "${loop_data}",
              hideRegExps: hideRegExps,
              ignoreError: ignoreError)));
        } else if (loop_data is bool) {
          // skip
          newData.add(loop_data);
        } else {
          // if (loop_data is )
          newData.add(loop_data);
        }
      } catch (e) {
        if (ignoreError) {
          newData.add(loop_data);
        } else {
          rethrow;
        }
      }
    }

    return newData;
  }

  Map cloneRecuriveMap({
    required Map data,
    required List<HideRegExp> hideRegExps,
    bool ignoreError = false,
  }) {
    Map newData = {};

    data.forEach((key, value) {
      for (var i = 0; i < hideRegExps.length; i++) {
        try {
          HideRegExp hideRegExp = hideRegExps[i];
          if (hideRegExp.regExp.hashData(key)) {
            if (value is Map) {
              newData[key] = cloneRecuriveMap(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError);
            } else if (value is List) {
              newData[key] = cloneRecuriveList(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError);
            } else if (value is String) {
              if (hideRegExp.hideDataType == HideDataType.replace) {
                newData[key] = hideRegExp.replace;
              }
              if (hideRegExp.hideDataType == HideDataType.obfuscate) {
                newData[key] = obfocustData(
                  mystring: value,
                  start: hideRegExp.startIndexObfuscate,
                  end: hideRegExp.endIndexObfuscate,
                );
              }
            } else if (data is int) {
              newData[key] = int.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is double) {
              newData[key] = double.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is num) {
              newData[key] = num.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is bool) {
              newData[key] = value;
            } else {
              newData[key] = value;
            }
          } else if (value is String) {
            if (hideRegExp.regExp.hashData(value)) {
              newData[key] = (hideData(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else {
              newData[key] = value;
            }
          } else {
            if (value is Map) {
              newData[key] = cloneRecuriveMap(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError);
            } else if (value is List) {
              newData[key] = cloneRecuriveList(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError);
            } else if (value is String) {
              newData[key] = (hideData(
                  data: value,
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is int) {
              newData[key] = int.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is double) {
              newData[key] = double.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is num) {
              newData[key] = num.parse(hideData(
                  data: "${value}",
                  hideRegExps: hideRegExps,
                  ignoreError: ignoreError));
            } else if (data is bool) {
              newData[key] = value;
            } else {
              newData[key] = value;
            }
          }
        } catch (e) {
          if (ignoreError) {
            newData[key] = "error_parse_script_library";
          } else {
            rethrow;
          }
        }
      }
    });

    return newData;
  }

  static T dataToOrigin<T>({
    required T data,
    required List<HideRegExp> hideRegExps,
    bool ignoreError = false,
  }) {
    Hide hide = Hide();
    try {
      if (data is Map || data is List) {
        if (data is Map) {
          return hide.cloneRecuriveMap(
              data: data,
              hideRegExps: hideRegExps,
              ignoreError: ignoreError) as T;
        } else if (data is List) {
          return hide.cloneRecuriveList(
              data: data,
              hideRegExps: hideRegExps,
              ignoreError: ignoreError) as T;
        }
      }
      if (data is String) {
        return (hide.hideData(
            data: data,
            hideRegExps: hideRegExps,
            ignoreError: ignoreError) as T);
      }
      if (data is int) {
        return int.parse(hide.hideData(
            data: "${data}",
            hideRegExps: hideRegExps,
            ignoreError: ignoreError)) as T;
      } else if (data is double) {
        return double.parse(hide.hideData(
            data: "${data}",
            hideRegExps: hideRegExps,
            ignoreError: ignoreError)) as T;
      } else if (data is num) {
        return num.parse(hide.hideData(
            data: "${data}",
            hideRegExps: hideRegExps,
            ignoreError: ignoreError)) as T;
      } else if (data is bool) {
        return data;
      }

      return (hide.hideData(
          data: data.toString(),
          hideRegExps: hideRegExps,
          ignoreError: ignoreError)) as T;
    } catch (e) {
      if (ignoreError) {
        return data;
      } else {
        rethrow;
      }
    }
  }

  static String dataToString({
    required dynamic data,
    required List<HideRegExp> hideRegExps,
    bool ignoreError = false,
  }) {
    dynamic result = dataToOrigin(
      data: data,
      hideRegExps: hideRegExps,
      ignoreError: ignoreError,
    );
    if (result is Map || result is List) {
      return json.encode(result);
    } else if (result is String) {
      return result;
    } else {
      return "${result}";
    }
  }
}
