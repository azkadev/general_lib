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
// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:general_lib/general_lib.dart';

class GenerateSecretWords {
  int min_count;
  int max_count;
  GenerateSecretWords({
    required this.min_count,
    required this.max_count,
  });

  static GenerateSecretWords minMax({
    required int minCount,
    required int maxCount,
  }) {
    return GenerateSecretWords(
      min_count: minCount,
      max_count: maxCount,
    );
  }

  static GenerateSecretWords fixed({required int totalCount}) {
    return GenerateSecretWords(
      max_count: totalCount,
      min_count: totalCount,
    );
  }

  int totalLength() {
    if (min_count == max_count) {
      return min_count;
    }
    return Random().nextInt(max_count - min_count + 1) + min_count;
  }
}

class Generate {
  Generate();

  static List<String> secretRandomWords({
    required int totalCount,
    required GenerateSecretWords generateSecretWords,
    String schema = "0123456789abcdefghijklmnopqrstuvwxyz",
  }) {
    List<String> secretWords = [];

    while (true) {
      if (secretWords.length == totalCount) {
        return secretWords;
      } else {
        String randomWord =
            generateUuid(generateSecretWords.totalLength(), text: schema);
        if (!secretWords.contains(randomWord)) {
          secretWords.add(randomWord);
        }
      }
    }
  }
}
