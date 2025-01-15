import 'package:general_lib/log/log.dart';
import 'package:io_universe/io_universe.dart';

void main(List<String> args) async {
  final GeneralLibraryLog generalLibraryLog = GeneralLibraryLog(
    logOptions: GeneralLibraryLogOptions(
      textTitle: "General Lib",
      textContext: "dev log",
    ),
  );

  {
    for (var i = 0; i < 2; i++) {
      await generalLibraryLog.printToTerminal(
        logMessage: GeneralLibraryLogMessage(
          value: "index: ${i + 1}",
          isForcePrint: false,
          stackTrace: StackTrace.current,
          isFullDetail: false,
          logMessageType: GeneralLibraryLogMessageType.info,
          logOptions: null,
        ),
      );
    }
  }
  exit(0);
}
