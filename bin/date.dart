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
import 'dart:math';

import 'package:general_lib/extension/dynamic.dart';

void main(List<String> args) {
  DateTime dateTime = (DateTime.parse("2021-05-31"));
  Duration duration = DateTime.now().difference(dateTime);
  duration.inDays.printPretty();
  "FIXED: ${(DateTime.now().difference(dateTime).inDays * 5000000)}"
      .printPretty();
  int total_count = 0;
  for (var i = 0; i <= duration.inDays; i++) {
    total_count += Random().nextInt(100000000) + 50000000;
  }
  // 53.294.354.183
  // 54.000.194.427
  // 61.089.951.855
  // 105.057.443.512
  // 26.211.715
  print(total_count);
}
