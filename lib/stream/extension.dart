import 'dart:async';

/// GeneralLib
extension StreamControllerExtensionGeneralLibraryStream<T>
    on StreamController<T> {
  /// GeneralLib
  Future<bool> generalLibraryUtilsIsCanSendNow({
    Duration delayDuration = Duration.zero,
  }) async {
    if (delayDuration < Duration(microseconds: 1)) {
      delayDuration = Duration(microseconds: 1);
    }
    while (true) {
      await Future.delayed(delayDuration);
      if (isClosed) {
        return false;
      }
      if (isPaused) {
        continue;
      }
      return true;
    }
  }
}
