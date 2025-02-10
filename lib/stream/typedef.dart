import 'dart:async';

/// GeneralLib
typedef GeneralLibraryStreamOnStreamControllerFunction<T> = void Function(
    StreamController<T> streamController, Duration delayDuration);
