import 'dart:async';

///
abstract class GeneralLibraryDynamicLibraryBaseCore {
  ///
  FutureOr<void> ensureInitialized();
///
  bool isCrash();
///
  bool isDeviceSupport();
///
  FutureOr<void> close();
///
  FutureOr<void> dispose();
}
///
abstract class GeneralLibraryDynamicLibraryBase implements GeneralLibraryDynamicLibraryBaseCore {
  
}
