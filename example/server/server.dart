// ignore_for_file: non_constant_identifier_names

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
import 'dart:typed_data';

import 'package:general_lib/extension/server.dart';
import 'package:path/path.dart';
import 'package:server_universe/native.dart';
import 'package:io_universe/io_universe.dart';

void main(List<String> args) async {
  ServerUniverseNative app = ServerUniverseNative();

  File file = File('/home/galaxeus/Documents/galaxeus/app/general_project/library/general_lib/examples/sma.mp3');

  app.all('/download/*', (req, res) {
    if (!["get", "head"].contains(req.method.toLowerCase())) {
      res.statusCode = 400;
      return res.send("ok");
    }
    res.headers.set("content-length", file.lengthSync());
    if (req.method.toLowerCase() == "head") {
      return res.send("ok");
    }

    var (start, end) = req.headers.general_lib_utils_range();
    // res.headers.chunkedTransferEncoding = true;
    // res.headers.contentType = ContentType("application", "octet-stream​");
    // res.headers.set("content-type", "application/octet-stream​");
    res.setDownload(filename: basename(file.path));
    Uint8List datas = file.readAsBytesSync();

    if (end != 0 && file.lengthSync() != end) {
      Uint8List newBytes = datas.sublist(start.toInt(), end.toInt());
      res.headers.set("content-length", newBytes.length);
      return file;
    }
    return file;
    // return datas;
  });

  await app.listen();
}
