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
// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:general_lib/dart/dart.dart';

class Log {
  Object? data;
  String title;
  String name;
  Zone? zone;
  Object? error;
  StackTrace? stackTrace;
  DateTime? dateTimeStart;
  DateTime? dateTimeNow;
  Log(
    this.data, {
    this.title = "LOG",
    this.name = "info",
    this.zone,
    this.dateTimeNow,
    this.dateTimeStart,
    this.error,
    this.stackTrace,
    bool? isPrintToTerminal = true,
  }) {
    dateTimeStart ??= DateTime.now();
    dateTimeNow ??= DateTime.now();
    if (isPrintToTerminal is bool) {
      if (isPrintToTerminal) {
        printToTerminal();
      }
    } else {
      // dart
      if (Dart.isDebug) {
        printToTerminal();
      }
    }
  }

  String getAllText() {
    String msg = "${title}";
    // msg += "\n[DATE TIME START]\t${dateTimeStart.toString()}";
    // // }
    // // if (dateTimeNow != null)
    // msg += "\n[DATE TIME NOW]\t${dateTimeNow.toString()}";
    msg += "\nMessage";
    if (data is Map || data is List) {
      msg += "\n${JsonEncoder.withIndent(" " * 2).convert(data)}";
    } else {
      msg += "\n${data.toString()}";
    }
    // if (stackTrace != null) {
    msg += "\n${name.toUpperCase()}";

    List<String> error_stacks = stackTrace.toString().trim().split("\n");
    for (var i = 0; i < error_stacks.length; i++) {
      String error = error_stacks[i];
      msg += "\n[${name}]\t${error}";
    }
    // }

    return msg;
  }

  String getLongTextByText({
    required String textSelebew,
  }) {
    List<String> msgs = textSelebew.split("\n");

    String text = "";

    for (var i = 0; i < msgs.length; i++) {
      String msg = msgs[i];
      if (msg.length > text.length) {
        text = msg.replaceAll(RegExp(r"\t"), " ");
      }
    }

    return "${" " * 2}${text}${" " * 2}";
  }

  String getLongText() {
    List<String> msgs = getAllText().split("\n");

    String text = "";

    for (var i = 0; i < msgs.length; i++) {
      String msg = msgs[i];
      if (msg.length > text.length) {
        text = msg.replaceAll(RegExp(r"\t"), " ");
      }
    }

    return "${" " * 2}${text}${" " * 2}";
  }

  String line(
      {required String text, required String fill, required int longText}) {
    final fillCount = longText - text.length;
    List<String> left = List.generate(fillCount ~/ 2, (index) => fill);
    List<String> right =
        List.generate(fillCount - left.length, (index) => fill);
    // final left = List.filled(fillCount ~/ 2, fill);
    // final right = List.filled(fillCount - left.length, fill);
    return left.join() + text + right.join();
  }

  String containerFull({
    required String text,
    required int longText,
  }) {
    return "${containerTop(longText: longText)}\n${containerMid(text: text, longText: longText)}\n${containerEnd(longText: longText)}";
  }

  String containerTop({
    required int longText,
  }) {
    return "╔${line(text: '', fill: '═', longText: longText)}╗";
  }

  String containerMid({
    required String text,
    required int longText,
  }) {
    return "║${line(text: text, fill: ' ', longText: longText)}║";
  }

  String containerMidClose({
    required int longText,
  }) {
    // print('╟${line('', '─')}╢');
    return "╟${line(text: "", fill: '─', longText: longText)}╢";
  }

  String containerEnd({
    required int longText,
  }) {
    return "╚${line(text: "", fill: '═', longText: longText)}╝";
  }

  void printToTerminal() {
    print(toString());
  }

  @override
  String toString() {
    String longText = getLongTextByText(
      textSelebew:
          [title, "Message", name.toUpperCase(), "Complete"].join("\n"),
    );

    String msg = containerFull(text: title, longText: longText.length);
    // if (dateTimeStart != null) {
    //   msg += "\n[DATE TIME START]\t: ${dateTimeStart.toString()}";
    // }
    // if (dateTimeNow != null) {
    //   msg += "\n[DATE TIME NOW]\t: ${dateTimeNow.toString()}";
    // }

    msg += "\n${containerFull(text: "Message", longText: longText.length)}";

    if (data is Map || data is List) {
      msg += "\n${JsonEncoder.withIndent(" " * 2).convert(data)}";
    } else {
      msg += "\n${data.toString()}";
    }
    if (stackTrace != null) {
      msg +=
          "\n${containerFull(text: name.toUpperCase(), longText: longText.length)}";
      List<String> error_stacks = stackTrace.toString().trim().split("\n");
      for (var i = 0; i < error_stacks.length; i++) {
        String error = error_stacks[i];
        msg += "\n[${name}]\t${error}";
      }
    }

    msg += "\n${containerFull(text: "Complete", longText: longText.length)}";
    return msg;
  }
}

void main(List<String> args) {
  Log log = Log(
    "Slebew plspalpslapslpalspalspalpsalpslpasa",
    // stackTrace: StackTrace.current,
    error: "m",

    isPrintToTerminal: false,
  );
  print(log.toString());
}
