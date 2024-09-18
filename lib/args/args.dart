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

import 'package:general_lib/extension/extension.dart';
import 'package:general_lib/extension/regexp.dart';

class Args {
  final List<String> arguments = [];

  Args(List<String> args) {
    arguments.addAll(args);
  }

  factory Args.fromString(String arg) {
    final List<String> args = [];
    String state_data = "";

    for (var i = 0; i < arg.length; i++) {
      String loop_data = arg[i];
      if (state_data.isNotEmpty) {
        void addStateData(String end_data, int index) {
          for (var index_state = index; index_state < arg.length; index_state++) {
            if (index_state == arg.length - 1) {
              state_data += arg[index_state];
              i = index_state;
              args.add(state_data);
              state_data = "";
              break;
            } else if (RegExp(end_data, caseSensitive: false).hashData(arg[index_state])) {
              if (end_data == " ") {
              } else {
                state_data += arg[index_state];
              }
              i = index_state;
              args.add(state_data);
              state_data = "";
              break;
            } else {
              state_data += arg[index_state];
            }
          }
        }

        while (true) {
          if (state_data.isEmpty) {
            break;
          }
          String state_data_first = state_data[0];
          if (RegExp("([-+=])", caseSensitive: false).hashData(state_data_first)) {
            addStateData(" ", i);
            break;
          } else if (RegExp("([\"'`])", caseSensitive: false).hashData(state_data_first)) {
            addStateData(state_data_first, i);
            break;
          } else {
            addStateData(" ", i);
            break;
          }
        }
      } else {
        if (loop_data != " ") {
          state_data += loop_data;
        }
      }
    }
    return Args(args);
  }

  bool contains(
    Object? key, {
    bool isRemoveIfFound = false,
  }) {
    if (key is String) {
      if (arguments.contains(key)) {
        if (isRemoveIfFound) {
          arguments.remove(key);
        }
        return true;
      }
    } else if (key is List<String>) {
      for (final String element in key) {
        if (arguments.contains(element)) {
          if (isRemoveIfFound) {
            arguments.remove(element);
          }
          return true;
        }
      }
    }
    return false;
  }

  String? operator [](Object? key) {
    if (key is String) {
      for (var i = 0; i < arguments.length; i++) {
        String arg = arguments[i];
        if (arg == key) {
          try {
            return arguments[i + 1];
          } catch (e) {
            return null;
          }
        }
      }
    }
    if (key is int) {
      try {
        return arguments[key];
      } catch (e) {
        return null;
      }
    }
    if (key is List<String>) {
      for (final String data in key) {
        final String? args_data = this[data];
        if (args_data != null) {
          return args_data;
        }
      }
    }
    return null;
  }

  String? after(Object? data) {
    if (data is int) {
      return this[data + 1];
    }
    if (data is String) {
      return this[data];
    }
    return this[data];
  }

  String? before(Object? data) {
    if (data is int) {
      return this[data - 1];
    }
    if (data is String) {
      return this[findIndex(data) ?? 0 - 1];
    }
    return null;
  }

  void operator []=(String key, String value) {
    int? index = findIndex(key);
    if (index != null) {
      try {
        arguments[index + 1] = value;
      } catch (e) {
        arguments.add(value);
      }
    } else {
      arguments.addAll([
        key,
        value,
      ]);
    }
  }

  int? findIndex(String name) {
    for (var i = 0; i < arguments.length; i++) {
      String arg = arguments[i];
      if (arg == name) {
        try {
          return i;
        } catch (e) {
          return null;
        }
      }
    }
    return null;
  }
}
