// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

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

import 'dart:math';

import 'package:general_lib/extension/extension.dart';
import 'package:io_universe/io_universe.dart';


/// GeneralLib
enum NetworkClientConnectionType {

/// GeneralLib
  http,

/// GeneralLib
  tcpsocket,

/// GeneralLib
  websocket,
}


/// GeneralLib
enum GeneralLibSchemeType {

/// GeneralLib
  database,

/// GeneralLib
  local,

/// GeneralLib
  scheme;


/// GeneralLib
  String toSpesialType() {
    if (this == database) {
      return "Database";
    }
    if (this == local) {
      return "LocalDatabase";
    }
    return "";
  }
}

/// getRandom uuid for parameters @extra
String getUuid(int length, {String? text}) {
  var ch = '0123456789abcdefghijklmnopqrstuvwxyz';
  if (text != null && text.isNotEmpty) {
    ch = text;
  }
  Random r = Random();
  return String.fromCharCodes(
      Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
}

/// GeneralLib

String generateUuid(
  int length, {
  String text = "0123456789abcdefghijklmnopqrstuvwxyz",
}) {
  // final Random random = Random();
  return List.generate(length, (index) {
    final String data_text = text[Random().nextInt(text.length)];
    if (Random().nextBool()) {
      return data_text.toUpperCase();
    } else {
      return data_text;
    }
  }).join("");
}

/// GeneralLib

T getRandomElement<T>(List<T> list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}

/// GeneralLib
class JsonDataScript {
  
/// GeneralLib
  String className;
  
/// GeneralLib
  List<String> datas;
  
/// GeneralLib
  bool is_isar;
  
/// GeneralLib
  JsonDataScript({
    required this.className,
    required this.datas,
    this.is_isar = false,
  });

/// GeneralLib
  String get first {
    return datas.first;
  }
/// GeneralLib

  String get last {
    return datas.last;
  }

/// GeneralLib
  String get first_name {
    return "${className.snakeCaseClass().toLowerCase()}.dart";
  }
/// GeneralLib

  String get last_name {
    return "${className.snakeCaseClass().toLowerCase()}.g.dart";
  }

/// GeneralLib
  Future<Directory> saveToFile(Directory output) async {
    if (!output.existsSync()) {
      await output.create(recursive: true);
    }

    String output_path = output.path;
    String output_first_name = output_path;
    // ignore: unused_local_variable
    String output_last_name = output_path;
    if ((output_path[output_path.length - 1] == Platform.pathSeparator)) {
      output_first_name = "${output_path}${first_name}";
      output_last_name = "${output_path}${last_name}";
    } else {
      output_first_name =
          "${output_path}${Platform.pathSeparator}${first_name}";
      output_last_name = "${output_path}${Platform.pathSeparator}${last_name}";
    }
    await File(output_first_name).writeAsString(first);
    if (is_isar) {
      // await File(output_last_name).writeAsString(last);
    }
    return output;
  }
}

/// GeneralLib
(List<int> offsets, int limit) createOffset({
  required int totalCount,
  required int limitCount,
}) {
  int offset = 0;
  List<int> listOffset = [0];
  for (var i = 0; i < (totalCount ~/ limitCount).toInt(); i++) {
    for (var ii = 0; ii <= limitCount; ii++) {
      if (ii == limitCount) {
        offset = (offset + limitCount);
      }
    }
    listOffset.add(offset);
  }
  return (listOffset, limitCount);
}
