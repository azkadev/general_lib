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
import 'dart:convert';
import 'package:io_universe/io_universe.dart';

import 'package:general_lib/download/download_core.dart';
import 'package:general_lib/extension/dynamic.dart';
import 'package:path/path.dart';

void main() async {
  // URL file yang ingin diunduh
  Uri uri = Uri.parse(
    "https://vdownload-25.sb-cd.com/5/4/5450977-480p.mp4?secure=egQfgloGofNWOITR8kjtrg,1719847433&m=25&d=1&_tid=5450977&d=1&name=javhd_video_1527.mp4",
  );
  DownloadClient download = DownloadClient();
  Directory directory_temp = Directory(join(Directory.current.path, "temp"));
  if (directory_temp.existsSync()) {
    directory_temp.deleteSync(recursive: true);
  }
  directory_temp.createSync(recursive: true);
  print("Finished");
  stdin.listen((event) async {
    String text = utf8.decode(event).trim();
    print("COMMAND: ${text}");
    if (text == "status") {
      print(download.downloadClientDatas);
    }
    if (text == "download") {
      int interval_count = 4;
      int interval_this = interval_count;
      DownloadClientData res = await download.download(
        url: uri,
        directoryDownload: directory_temp,
        onProggres: (double proggres, File file) {
          if (interval_this >= interval_count) {
            print("Downloaded: ${proggres.toStringAsFixed(2)}");
            interval_this = 0;
          } else {
            interval_this++;
          }
        },
        onDone: (DownloadClientData downloadClientData) async {
          downloadClientData.uri.toString().printPretty();
        },
      );
      print("wait");
      (await res.completer.future);
      print("complete");
    }
  });
}
