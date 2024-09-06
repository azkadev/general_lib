import 'mini/mini.dart';

class DatabaseGeneralLib {
  static final Map<String, DatabaseMiniGeneralLibrary> _stateDbMini = {};
  DatabaseGeneralLib();
  
  DatabaseMiniGeneralLibrary openDatabaseMini({
    required String key,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
  }) {
    final DatabaseMiniGeneralLibrary? databaseMiniGeneralLibraryOld = _stateDbMini[key];
    if (databaseMiniGeneralLibraryOld == null) {
      final DatabaseMiniGeneralLibrary newDatabaseMiniGeneralLibrary = DatabaseMiniGeneralLibrary();
      newDatabaseMiniGeneralLibrary.ensureInitialized(
        pathToFile: key,
        databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions,
      );
      newDatabaseMiniGeneralLibrary.initiaLizedSync();
      _stateDbMini[key] = newDatabaseMiniGeneralLibrary;
      return newDatabaseMiniGeneralLibrary;
    }
    return databaseMiniGeneralLibraryOld;
  }

  bool closeDatabaseMini({
    required String key,
  }) {
    final DatabaseMiniGeneralLibrary? databaseMiniGeneralLibraryOld = _stateDbMini[key];
    if (databaseMiniGeneralLibraryOld == null) {
      return true;
    }
    databaseMiniGeneralLibraryOld.close();
    _stateDbMini.remove(key);
    return true;
  }

}
