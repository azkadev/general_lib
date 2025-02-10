import 'dart:async';

/// GeneralLib
abstract class GeneralLibraryDynamicLibraryBaseCore {
  /// GeneralLib
  FutureOr<void> ensureInitialized();

  /// GeneralLib
  bool isCrash();

  /// GeneralLib
  bool isDeviceSupport();

  /// GeneralLib
  FutureOr<void> close();

  /// GeneralLib
  FutureOr<void> dispose();
}

/// GeneralLib
abstract class GeneralLibraryDynamicLibraryBase
    implements GeneralLibraryDynamicLibraryBaseCore {}
