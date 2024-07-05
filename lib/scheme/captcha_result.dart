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
import "json_dart.dart";
// import "dart:convert";

import "emoji.dart";

class CaptchaResult extends JsonDart {
  CaptchaResult(super.rawData);

  static Map get defaultData {
    return {
      "@type": "captchaResult",
      "type": "words",
      "emoji_answer": {"@type": "emoji"},
      "random_words": [],
      "words": []
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get type {
    try {
      if (rawData["type"] is String == false) {
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }

  Emoji get emoji_answer {
    try {
      if (rawData["emoji_answer"] is Map == false) {
        return Emoji({});
      }
      return Emoji(rawData["emoji_answer"] as Map);
    } catch (e) {
      return Emoji({});
    }
  }

  List<Object> get random_words {
    try {
      if (rawData["random_words"] is List == false) {
        return [];
      }
      return (rawData["random_words"] as List).cast<Object>();
    } catch (e) {
      return [];
    }
  }

  List<Object> get words {
    try {
      if (rawData["words"] is List == false) {
        return [];
      }
      return (rawData["words"] as List).cast<Object>();
    } catch (e) {
      return [];
    }
  }

  static CaptchaResult create({
    String? special_type,
    String? type,
    Emoji? emoji_answer,
    List<Object>? random_words,
    List<Object>? words,
  }) {
    CaptchaResult captchaResult = CaptchaResult({
      "@type": special_type,
      "type": type,
      "emoji_answer": (emoji_answer != null) ? emoji_answer.toJson() : null,
      "random_words": random_words,
      "words": words,
    });

    return captchaResult;
  }
}
