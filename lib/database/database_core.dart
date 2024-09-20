import 'mini/mini.dart';

class DatabaseGeneralLib {
  static final Map<String, DatabaseMiniGeneralLibrary> _stateDbMini = {};
  DatabaseGeneralLib();
  
  DatabaseMiniGeneralLibrary openDatabaseMini({
    required String key,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
    required Map<dynamic, dynamic> defaultData,
  }) {
    final DatabaseMiniGeneralLibrary? databaseMiniGeneralLibraryOld = _stateDbMini[key];
    if (databaseMiniGeneralLibraryOld == null) {
      final DatabaseMiniGeneralLibrary newDatabaseMiniGeneralLibrary = DatabaseMiniGeneralLibrary();
      newDatabaseMiniGeneralLibrary.ensureInitialized(
        pathToFile: key,
        databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions,
      );
      newDatabaseMiniGeneralLibrary.initiaLizedSync(
        defaultData: defaultData,
      );
      _stateDbMini[key] = newDatabaseMiniGeneralLibrary;
      return newDatabaseMiniGeneralLibrary;
    }
    return databaseMiniGeneralLibraryOld;
  }
  
  Future<DatabaseMiniGeneralLibrary> openDatabaseMiniAsync({
    required String key,
    required DatabaseMiniGeneralLibraryBaseOptions databaseMiniGeneralLibraryBaseOptions,
    required Map<dynamic, dynamic> defaultData,
  }) async{
    final DatabaseMiniGeneralLibrary? databaseMiniGeneralLibraryOld = _stateDbMini[key];
    if (databaseMiniGeneralLibraryOld == null) {
      final DatabaseMiniGeneralLibrary newDatabaseMiniGeneralLibrary = DatabaseMiniGeneralLibrary();
      newDatabaseMiniGeneralLibrary.ensureInitialized(
        pathToFile: key,
        databaseMiniGeneralLibraryBaseOptions: databaseMiniGeneralLibraryBaseOptions,
      );
      await newDatabaseMiniGeneralLibrary.initiaLized(
        defaultData: defaultData,
      );
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
