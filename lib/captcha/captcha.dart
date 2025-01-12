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

import 'package:collection/collection.dart';
import 'package:general_lib/extension/extension.dart';
import 'package:general_lib/scheme/captcha_word.dart';

/// GeneralLibrary
class CaptchaGeneralLib {
  /// GeneralLibrary
  List<Map<String, String>> animalEmoji = [
    {
      "emoji": "🦊️",
      "name": "fox",
    },
    {
      "emoji": "🐒️",
      "name": "monkey",
    },
    {
      "emoji": "🦍️",
      "name": "gorilla",
    },
    {
      "emoji": "🐯️",
      "name": "tiger",
    },
    {
      "emoji": "🦖️",
      "name": "dinosaur",
    },
    {
      "emoji": "🐝️",
      "name": "bee",
    },
    {
      "emoji": "🐘️",
      "name": "elephant",
    },
    {
      "emoji": "🐷️",
      "name": "pig",
    },
    {
      "emoji": "🐍️",
      "name": "snake",
    },
    {
      "emoji": "🦂️",
      "name": "scorpion",
    }
  ];

  /// GeneralLibrary
  List<String> default_words = [
    "guru",
    "dokter",
    "bekerja",
    "belajar",
    "bermain",
    "game",
    "makanan",
    "duduk",
    "air",
    "minuman",
    "mangga",
    "bakso",
  ];

  /// GeneralLibrary
  CaptchaGeneralLib();

  /// GeneralLibrary
  CaptchaResult animalCaptcha({
    List<Map>? emojis,
    int captchaLength = 5,
    Duration timeOut = const Duration(minutes: 1),
  }) {
    emojis ??= animalEmoji;
    if (captchaLength > emojis.length) {
      throw "captchaLength melebihi emojis length";
    }
    Map jsonKey = emojis[Random().nextInt(emojis.length)];
    List<Map> result = [jsonKey];
    DateTime dateTime = DateTime.now().add(timeOut);

    while (true) {
      if (dateTime.isBefore(DateTime.now())) {}

      if (result.length == captchaLength) {
        return CaptchaResult(
          answer: jsonKey,
          captchas: result,
        );
      }
      Map randomEmoji = emojis[Random().nextInt(emojis.length)];

      if (!DeepCollectionEquality().equals(randomEmoji, jsonKey)) {
        bool isNotFoundSame = true;
        for (var index = 0; index < result.length; index++) {
          if (DeepCollectionEquality().equals(randomEmoji, result[index])) {
            isNotFoundSame = false;
          }
        }
        if (isNotFoundSame) {
          result.add(randomEmoji);
          result.shuffle();
        }
      }
    }
  }

  /// GeneralLibrary
  T randomByDatas<T>(List<T> datas) {
    return datas[Random().nextInt(datas.length)];
  }

  /// GeneralLibrary
  CaptchaWord words({
    List<String>? words,
    int captchaLength = 5,
    Duration timeOut = const Duration(minutes: 1),
  }) {
    words ??= default_words;
    if (captchaLength > words.length) {
      throw Exception("captchaLength melebihi words length");
    }
    String word = randomByDatas(words);
    List<String> results = [word];
    DateTime dateTime = DateTime.now().add(timeOut);

    int total_answer = captchaLength ~/ 4;

    if (total_answer < 5) {
      throw Exception("Captcha word total harus lebih 5");
    }

    while (true) {
      if (dateTime.isExpired()) {
        throw Exception("Captcha word time expired");
      }

      if (results.length == captchaLength) {
        List<int> answers = [];

        while (true) {
          if (dateTime.isExpired()) {
            throw Exception("Captcha word time expired");
          }
          int random_data = Random().nextInt(captchaLength);
          if (answers.length == total_answer) {
            break;
          }
          if (answers.contains(random_data)) {
          } else {
            answers.add(random_data);
          }
        }
        return CaptchaWord.create(
          special_type: "captchaWord",
          answer: answers,
          words: results,
        );
      }
      if (results.contains(word)) {
        word = randomByDatas(words);
      } else {
        results.add(word);
      }
    }
  }
}

/// GeneralLibrary
class CaptchaResult {
  /// GeneralLibrary
  final Map answer;

  /// GeneralLibrary
  final List captchas;

  /// GeneralLibrary
  CaptchaResult({
    /// GeneralLibrary
    required this.answer,

    /// GeneralLibrary
    required this.captchas,
  });

  /// GeneralLibrary
  void clear() {
    answer.clear();

    captchas.clear();
  }

  /// GeneralLibrary
  Map toJson() {
    return {
      "answer": answer,
      "captchas": captchas,
    };
  }
}
