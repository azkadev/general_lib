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
        textContext: valueStringSetIfEmptReturnNull(value: logOptions.textContext),
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
  static final bool _isCanPrintToTerminal = Dart.executable_type == ExecutableType.cli;

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
