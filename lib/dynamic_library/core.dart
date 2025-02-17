import 'dart:async';

/// GeneralLib
abstract class GeneralLibraryDynamicLibraryBaseCore {
  /// GeneralLib
  FutureOr<void> ensureInitialized();

  /// GeneralLib
  FutureOr<void> initialized();

  /// GeneralLib
  bool isCrash();

  /// GeneralLib
  bool isDeviceSupport();

  /// GeneralLib
  FutureOr<void> dispose();
}

/// GeneralLib
abstract class GeneralLibraryDynamicLibraryBase
    implements GeneralLibraryDynamicLibraryBaseCore {}
