import 'minimalist/minimalist.dart';

class DatabaseGeneralLib {
  static final Map<String, DatabaseMinimalistGeneralLibrary> _stateDbMinamlist = {};
  DatabaseGeneralLib();

  DatabaseMinimalistGeneralLibrary openDatabaseMinimalist({
    required String key,
    required DatabaseMinimalistGeneralLibraryBaseOptions databaseMinimalistGeneralLibraryBaseOptions,
  }) {
    final DatabaseMinimalistGeneralLibrary? databaseMinimalistGeneralLibraryOld = _stateDbMinamlist[key];
    if (databaseMinimalistGeneralLibraryOld == null) {
      final DatabaseMinimalistGeneralLibrary newDatabaseMinimalistGeneralLibrary = DatabaseMinimalistGeneralLibrary();
      newDatabaseMinimalistGeneralLibrary.ensureInitialized(
        pathToFile: key,
        databaseMinimalistGeneralLibraryBaseOptions: databaseMinimalistGeneralLibraryBaseOptions,
      );
      newDatabaseMinimalistGeneralLibrary.initiaLizedSync();
      _stateDbMinamlist[key] = newDatabaseMinimalistGeneralLibrary;
      return newDatabaseMinimalistGeneralLibrary;
    }
    return databaseMinimalistGeneralLibraryOld;
  }
}
