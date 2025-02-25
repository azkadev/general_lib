import 'dart:async';

/// GeneralLib
abstract class GeneralLibrarySingleLibraryBaseCore {
  /// GeneralLib
  FutureOr<void> ensureInitialized();

  /// GeneralLib
  FutureOr<void> initialized();

  /// GeneralLib
  FutureOr<void> dispose();
}

/// GeneralLib
abstract class GeneralLibrarySingleLibraryBase
    implements GeneralLibrarySingleLibraryBaseCore {}
