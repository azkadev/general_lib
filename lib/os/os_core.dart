/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:general_lib/dart/dart.dart';
import "package:path/path.dart" as path;
import 'package:io_universe/io_universe.dart';

/// GeneralLib
class OperatingSystem {

/// GeneralLib
  OperatingSystem();

/// GeneralLib
  static Directory get app_directory {
    String? configDir;
    if (Platform.isLinux) {
      configDir = Platform.environment['XDG_CONFIG_HOME'] ??
          path.join(Platform.environment['HOME']!, '.config');
    } else if (Platform.isWindows) {
      configDir = Platform.environment['APPDATA']!;
    } else if (Platform.isMacOS) {
      configDir = path.join(
          Platform.environment['HOME']!, 'Library', 'Application Support');
    } else {
      configDir = path.join(Platform.environment['HOME'] ?? '', '.config');
    }

    return Directory(configDir);
  }

/// GeneralLib
  static Directory get home_directory {
    return Directory(Platform.environment['XDG_CONFIG_HOME'] ??
        path.join(Platform.environment['HOME']!));
  }

/// GeneralLib
  static String? getEnvironment(String key, [String? defaultValue]) {
    return Platform.environment[key] ?? defaultValue;
  }

/// GeneralLib
  static Future<bool> setEnvironment(String key, String value) async {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isLinux || Dart.isMacOS) {
      List<String> file_rcs = {
        ".bashrc",
        ".zshrc",
      }.toList();
      bool is_set_pocces = false;
      for (var index = 0; index < file_rcs.length; index++) {
        File file = File(path.join(home_directory.path, file_rcs[index]));
        if (!file.existsSync()) {
          continue;
        }
        String readFile = await file.readAsString();
        List<String> bashrcs = readFile.split("\n");

        RegExp regExp = RegExp(
            "export([ ]+)${key}=${RegExp.escape(json.encode(value))}",
            caseSensitive: false);
        bool is_not_found_path = true;
        for (var i = 0; i < bashrcs.length; i++) {
          String bashrc = bashrcs[i];
          if (regExp.hasMatch(bashrc)) {
            is_not_found_path = false;
            break;
          }
        }
        if (is_not_found_path) {
          bashrcs.add("export ${key}=${json.encode(value)}");
          await file.writeAsString(bashrcs.join("\n"));
        }

        if (Dart.isLinux) {
          try {
            // await Process.start(
            //   "gnome-terminal",
            //   [
            //     "-q",
            //     "--",
            //     "source",
            //     (file.path),
            //   ],
            //   workingDirectory: home_directory.path,
            //   // runInShell: true,
            // );
          } catch (e) {
            print(e);
          }
        }
        is_set_pocces = true;
      }
      return is_set_pocces;
    }
    if (Dart.isWindows) {
      await Process.run(
        "setx",
        [
          key,
          value,
        ],
        runInShell: true,
      );
      return true;
    }

    return false;
  }
}
