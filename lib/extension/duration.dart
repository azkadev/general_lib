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
// ignore_for_file: unnecessary_brace_in_string_interps, empty_catches

import 'package:general_lib/scheme/duration_data_scheme.dart';

extension DurationExtensions on Duration {
  String toAgo() {
    if (inDays >= 1) {
      return '${inDays} day(s) ago';
    } else if (inHours >= 1) {
      return '${inHours} hour(s) ago';
    } else if (inMinutes >= 1) {
      return '${inMinutes} minute(s) ago';
    } else if (inSeconds >= 1) {
      return '${inSeconds} second(s) ago';
    } else if (inMilliseconds >= 1) {
      return '${inMilliseconds} millisecond(s) ago';
    } else if (inMicroseconds >= 1) {
      return '${inMicroseconds} microsecond(s) ago';
    } else {
      return "just now";
    }
  }

  String toLeft() {
    if (inDays >= 1) {
      return '${inDays} day(s) left';
    } else if (inHours >= 1) {
      return '${inHours} hour(s) left';
    } else if (inMinutes >= 1) {
      return '${inMinutes} minute(s) left';
    } else if (inSeconds >= 1) {
      return '${inSeconds} second(s) left';
    } else if (inMilliseconds >= 1) {
      return '${inMilliseconds} millisecond(s) left';
    } else if (inMicroseconds >= 1) {
      return '${inMicroseconds} microsecond(s) left';
    } else {
      return "just now";
    }
  }

  String toDurationLocal() {
    if (inDays >= 1) {
      return '${inDays} days';
    } else if (inHours >= 1) {
      return '${inHours} hours';
    } else if (inMinutes >= 1) {
      return '${inMinutes} minutes';
    } else if (inSeconds >= 1) {
      return '${inSeconds} seconds';
    } else if (inMilliseconds >= 1) {
      return '${inMilliseconds} milliseconds';
    } else if (inMicroseconds >= 1) {
      return '${inMicroseconds} microseconds';
    } else {
      return "Life Time";
    }
  }

  Duration fromJson(Map data) {
    final DurationDataScheme durationData = DurationDataScheme(data);
    return Duration(
      days: (durationData.days ?? 0).toInt(),
      hours: (durationData.hours ?? 0).toInt(),
      minutes: (durationData.minutes ?? 0).toInt(),
      seconds: (durationData.seconds ?? 0).toInt(),
      milliseconds: (durationData.milliseconds ?? 0).toInt(),
      microseconds: (durationData.microseconds ?? 0).toInt(),
    );
  }

  String toText() {
    return "${inDays} ${inHours} ${inMinutes} ${inSeconds} ${inMilliseconds} ${inMicroseconds}";
  }

  Map toJson() {
    return DurationDataScheme.create(
      special_type: "durationDataScheme",
      days: inDays,
      hours: inHours,
      minutes: inMinutes,
      seconds: inSeconds,
      milliseconds: inMilliseconds,
      microseconds: inMicroseconds,
    ).toJson();
  }
}
