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
  });

  GeneralLibraryLogMessage copyWith({
    Object? value,
    bool? isForcePrint,
    StackTrace? stackTrace,
    bool? isFullDetail,
    GeneralLibraryLogMessageType? logMessageType,
  }) {
    return GeneralLibraryLogMessage(
      value: value ?? this.value,
      isForcePrint: isForcePrint ?? this.isForcePrint,
      stackTrace: stackTrace ?? this.stackTrace,
      isFullDetail: isFullDetail ?? this.isFullDetail,
      logMessageType: logMessageType ?? this.logMessageType,
    );
  }
}

/// GeneralLibraryLog
class GeneralLibraryLog {
  /// GeneralLibraryLog
  const GeneralLibraryLog();

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
