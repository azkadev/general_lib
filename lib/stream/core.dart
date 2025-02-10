import 'dart:async';

import 'typedef.dart';

/// GeneralLib
class GeneralLibraryStream {
  /// A controller with a [stream] that supports only one single subscriber.
  ///
  /// If [sync] is true, the returned stream controller is a
  /// [SynchronousStreamController], and must be used with the care
  /// and attention necessary to not break the [Stream] contract. If in doubt,
  /// use the non-sync version.
  ///
  /// Using an asynchronous controller will never give the wrong
  /// behavior, but using a synchronous controller incorrectly can cause
  /// otherwise correct programs to break.
  ///
  /// A synchronous controller is only intended for optimizing event
  /// propagation when one asynchronous event immediately triggers another.
  /// It should not be used unless the calls to [add] or [addError]
  /// are guaranteed to occur in places where it won't break `Stream` invariants.
  ///
  /// Use synchronous controllers only to forward (potentially transformed)
  /// events from another stream or a future.
  ///
  /// A Stream should be inert until a subscriber starts listening on it (using
  /// the [onListen] callback to start producing events). Streams should not
  /// leak resources (like websockets) when no user ever listens on the stream.
  ///
  /// The controller buffers all incoming events until a subscriber is
  /// registered, but this feature should only be used in rare circumstances.
  ///
  /// The [onPause] function is called when the stream becomes
  /// paused. [onResume] is called when the stream resumed.
  ///
  /// The [onListen] callback is called when the stream
  /// receives its listener and [onCancel] when the listener ends
  /// its subscription. If [onCancel] needs to perform an asynchronous operation,
  /// [onCancel] should return a future that completes when the cancel operation
  /// is done.
  ///
  /// If the stream is canceled before the controller needs data the
  /// [onResume] call might not be executed.
  static StreamController<T> generalLibraryCreateStreamController<T>({
    void Function()? onListen,
    void Function()? onPause,
    void Function()? onResume,
    FutureOr<void> Function()? onCancel,
    Duration delayDuration = Duration.zero,
    bool isSync = false,
    required GeneralLibraryStreamOnStreamControllerFunction<T>
        onStreamController,
  }) {
    if (delayDuration < Duration(microseconds: 1)) {
      delayDuration = Duration(microseconds: 1);
    }
    final StreamController<T> streamController = StreamController<T>(
      onListen: onListen,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel,
      sync: isSync,
    );
    onStreamController(streamController, delayDuration);
    return streamController;
  }
}
