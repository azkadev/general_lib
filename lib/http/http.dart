
export "io.dart"
    if (dart.library.io) 'io.dart'
    if (dart.library.html) 'web.dart';
