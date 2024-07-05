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

class DurationDataScheme extends JsonDart {
  DurationDataScheme(super.rawData);

  static Map get defaultData {
    return {
      "@type": "durationDataScheme",
      "days": 0,
      "hours": 0,
      "minutes": 0,
      "seconds": 0,
      "milliseconds": 0,
      "microseconds": 0
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

  int? get days {
    try {
      if (rawData["days"] is int == false) {
        return null;
      }
      return rawData["days"] as int;
    } catch (e) {
      return null;
    }
  }

  int? get hours {
    try {
      if (rawData["hours"] is int == false) {
        return null;
      }
      return rawData["hours"] as int;
    } catch (e) {
      return null;
    }
  }

  int? get minutes {
    try {
      if (rawData["minutes"] is int == false) {
        return null;
      }
      return rawData["minutes"] as int;
    } catch (e) {
      return null;
    }
  }

  int? get seconds {
    try {
      if (rawData["seconds"] is int == false) {
        return null;
      }
      return rawData["seconds"] as int;
    } catch (e) {
      return null;
    }
  }

  int? get milliseconds {
    try {
      if (rawData["milliseconds"] is int == false) {
        return null;
      }
      return rawData["milliseconds"] as int;
    } catch (e) {
      return null;
    }
  }

  int? get microseconds {
    try {
      if (rawData["microseconds"] is int == false) {
        return null;
      }
      return rawData["microseconds"] as int;
    } catch (e) {
      return null;
    }
  }

  static DurationDataScheme create({
    String? special_type,
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
    int? milliseconds,
    int? microseconds,
  }) {
    DurationDataScheme durationDataScheme = DurationDataScheme({
      "@type": special_type,
      "days": days,
      "hours": hours,
      "minutes": minutes,
      "seconds": seconds,
      "milliseconds": milliseconds,
      "microseconds": microseconds,
    });

    return durationDataScheme;
  }
}
