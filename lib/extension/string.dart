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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:convert';

import 'package:general_lib/general_lib.dart';

/// GeneralLib
extension GeneralLibExtensionString on String {

/// GeneralLib
  bool isFullData(RegExp regExp) {
    int count = 0;
    for (var i = 0; i < length; i++) {
      if (regExp.hashData(this[i])) {
        count += 1;
      }
    }
    return (count == length);
  }

/// GeneralLib
  RegExp toRegExp({
    bool multiLine = false,
    bool caseSensitive = false,
    bool unicode = false,
    bool dotAll = false,
  }) {
    String message = "";
    for (var i = 0; i < length; i++) {
      String msg = this[i];
      String symbol = r"*#";
      String similar_word = "";

      if (RegExp(r"^(a)$", caseSensitive: false).hashData(msg)) {
        similar_word = "4";
      }
      if (RegExp(r"^(i)$", caseSensitive: false).hashData(msg)) {
        similar_word = "1";
      }
      if (RegExp(r"^(e)$", caseSensitive: false).hashData(msg)) {
        similar_word = "3";
      }
      if (RegExp(r"^(o)$", caseSensitive: false).hashData(msg)) {
        similar_word = "0";
      }
      if (RegExp(r"^(g)$", caseSensitive: false).hashData(msg)) {
        similar_word = "9";
      }
      if (RegExp(r"^(s)$", caseSensitive: false).hashData(msg)) {
        similar_word = "5";
      }

      if (!RegExp(r"^(a|i|u|e|o)$", caseSensitive: false).hashData(msg)) {
        if (length < 5) {
          symbol = "";
        }
      }

      String msg_data = "[${msg}${similar_word}${symbol}]";
      msg = "(${msg_data}+|${msg_data})";
      if (i == (length - 1)) {
        message += "${msg}";
      } else {
        message += "${msg}([ \\n]+)?";
      }
    }
    return RegExp(
      message,
      multiLine: multiLine,
      caseSensitive: caseSensitive,
      unicode: unicode,
      dotAll: dotAll,
    );
  }

/// GeneralLib
  String hideData({int start = 2, int end = 2}) {
    var message = "";
    var numStart = start;
    var numEnd = length - end;
    for (int i = 0; i < length; i++) {
      var loopData = this[i];
      if (i == numEnd) {
        numEnd--;
        message += loopData;
      } else if (i == numStart) {
        numStart++;
        message += "*";
      } else {
        message += loopData;
      }
    }
    return message;
  }

/// GeneralLib
  String camelCaseClass({RegExp? regExp}) {
    regExp ??= RegExp(r"(_)", caseSensitive: false);
    String text = "";
    for (var i = 0; i < length; i++) {
      var loopData = this[i];
      if (i == 0) {
        text += loopData.toUpperCase();
      } else {
        if (regExp.hasMatch(text[text.length - 1])) {
          text += loopData.toUpperCase();
        } else {
          text += loopData;
        }
      }
    }
    return text.replaceAll(regExp, "");
  }

/// GeneralLib
  String toUpperCaseFirstData() {
    String text = "";
    for (var i = 0; i < length; i++) {
      var loopData = this[i];
      if (i == 0) {
        text += loopData.toUpperCase();
      } else {
        text += loopData;
      }
    }
    return text;
  }

/// GeneralLib
  String toLowerCaseFirstData() {
    String text = "";
    for (var i = 0; i < length; i++) {
      var loopData = this[i];
      if (i == 0) {
        text += loopData.toLowerCase();
      } else {
        text += loopData;
      }
    }
    return text;
  }

/// GeneralLib
  String snakeCaseClass({RegExp? regExp}) {
    regExp ??= RegExp(r"(_)", caseSensitive: false);
    String text = "";
    for (var i = 0; i < length; i++) {
      var loopData = this[i];
      if (RegExp(r"[A-Z]").hashData(loopData) && i != 0) {
        text += "_${loopData}";
      } else {
        text += loopData;
      }
    }
    return text.toLowerCase();
  }

/// GeneralLib
  String general_lib_utils_encryptToBase64() {
    return base64.encode(utf8.encode(this));
  }

/// GeneralLib
  String general_lib_utils_decryptFromBase64({bool? allowMalformed}) {
    return utf8.decode(base64.decode(this), allowMalformed: allowMalformed);
  }

/// GeneralLib
  String general_lib_utils_crypto_encryptToBase64({
    required Crypto crypto,
  }) {
    return crypto.encrypt(data: this);
  }

/// GeneralLib
  String general_lib_utils_crypto_decryptFromBase64({
    required Crypto crypto,
  }) {
    return crypto.decrypt(data: this);
  }
}
