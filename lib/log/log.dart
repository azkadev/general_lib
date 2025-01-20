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
import 'dart:async';

import 'package:general_lib/dart/dart.dart';
import 'package:general_lib/dart/executable_type/executable.dart';
import 'package:general_lib/extension/extension.dart';
import 'package:stack_trace/stack_trace.dart';

/// GeneralLibraryLog
enum GeneralLibraryLogMessageType {
  /// GeneralLibraryLog
  error,

  /// GeneralLibraryLog
  info,

  /// GeneralLibraryLog
  debug,

  /// GeneralLibraryLog
  succes;
}

/// GeneralLibraryLog
class GeneralLibraryLogMessage {
  /// GeneralLibraryLog
  final Object? value;

  /// GeneralLibraryLog
  final StackTrace stackTrace;

  /// GeneralLibraryLog
  final GeneralLibraryLogMessageType logMessageType;

  /// GeneralLibraryLog
  final bool isForcePrint;

  /// GeneralLibraryLog
  final bool isFullDetail;

  /// GeneralLibraryLog
  final GeneralLibraryLogOptions? logOptions;

  /// GeneralLibraryLog
  const GeneralLibraryLogMessage({
    /// GeneralLibraryLog
    required this.value,

    /// GeneralLibraryLog
    required this.isForcePrint,

    /// GeneralLibraryLog
    required this.stackTrace,

    /// GeneralLibraryLog
    required this.isFullDetail,

    /// GeneralLibraryLog
    required this.logMessageType,

    /// GeneralLibraryLog
    required this.logOptions,
  });

  /// GeneralLib
  GeneralLibraryLogMessage copyWith({
    Object? value,
    bool? isForcePrint,
    StackTrace? stackTrace,
    bool? isFullDetail,
    GeneralLibraryLogMessageType? logMessageType,
    GeneralLibraryLogOptions? logOptions,
  }) {
    return GeneralLibraryLogMessage(
      value: value ?? this.value,
      isForcePrint: isForcePrint ?? this.isForcePrint,
      stackTrace: stackTrace ?? this.stackTrace,
      isFullDetail: isFullDetail ?? this.isFullDetail,
      logMessageType: logMessageType ?? this.logMessageType,
      logOptions: logOptions ?? this.logOptions,
    );
  }
}

/// GeneralLibraryLog
class GeneralLibraryLogOptions {
  /// GeneralLibraryLog
  final String textTitle;

  /// GeneralLibraryLog
  final String textContext;

  /// GeneralLibraryLog
  const GeneralLibraryLogOptions({
    required this.textTitle,
    required this.textContext,
  });

  /// GeneralLibraryLog
  GeneralLibraryLogOptions patchWith({
    GeneralLibraryLogOptions? logOptions,
  }) {
    if (logOptions != null) {
      return copyWith(
        textTitle: valueStringSetIfEmptReturnNull(value: logOptions.textTitle),
        textContext:
            valueStringSetIfEmptReturnNull(value: logOptions.textContext),
      );
    }
    return this;
  }

  /// GeneralLibraryLog
  String? valueStringSetIfEmptReturnNull({
    required String? value,
  }) {
    final String vl = (value ?? "").trim();
    if (vl.isEmpty) {
      return null;
    }
    return vl;
  }

  /// GeneralLibraryLog
  GeneralLibraryLogOptions copyWith({
    final String? textTitle,
    final String? textContext,
  }) {
    return GeneralLibraryLogOptions(
      textTitle: textTitle ?? this.textTitle,
      textContext: textContext ?? this.textContext,
    );
  }
}

/// GeneralLibraryLog
class GeneralLibraryLog {
  /// GeneralLibraryLog
  final GeneralLibraryLogOptions logOptions;

  /// GeneralLibraryLog
  const GeneralLibraryLog({
    required this.logOptions,
  });

  /// GeneralLibraryLog
  static final bool _isCanPrintToTerminal =
      Dart.executable_type == ExecutableType.cli;

  /// GeneralLibraryLog
  FutureOr<void> printToTerminal({
    required GeneralLibraryLogMessage logMessage,
  }) async {
    if (_isCanPrintToTerminal || logMessage.isForcePrint) {
      try {
        print(("---" * 5) + logMessage.logMessageType.name + ("---" * 5));
        if (logMessage.isFullDetail) {
          print(logMessage.stackTrace.toString());
        } else {
          print(Trace.from(logMessage.stackTrace).terse.toString());
        }
        final GeneralLibraryLogOptions logOptions = this.logOptions.patchWith(
              logOptions: logMessage.logOptions,
            );
        print("""
• 🆔 Title: ${logOptions.textTitle}
• 📍 Context: ${logOptions.textContext}
• 📄 Message:
""");
        if (logMessage.value is Map || logMessage.value is List) {
          (logMessage.value ?? {}).printPretty();
        } else {
          print(logMessage.value);
        }
        print("${"---" * 5}Finished${"---" * 5}");
      } catch (e, stack) {
        print("$e $stack");
      }
    }
  }
}
