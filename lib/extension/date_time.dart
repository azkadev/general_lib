// ignore_for_file: unnecessary_brace_in_string_interps, empty_catches, non_constant_identifier_names

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
extension DateTimeExtensions on DateTime {
  bool isExpired() {
    return isBefore(DateTime.now());
  }

  ///
  /// Example:
  /// ```dart
  /// DateTime.now().add(Duration(days: 10)).extension_general_lib_countDownFromDateTime(
  ///   dateTime: DateTime.now(),
  /// );
  /// ```
  ///
  /// result: example
  /// 1 days 5 minutes 5 seconds
  String extension_general_lib_countDownFromDateTime({
    required DateTime dateTime,
  }) {
    try {
      Duration duration = difference(dateTime);
      String message = "";
      if (duration.inDays >= 1) {
        message += "${duration.inDays} Days";
      }
      if (duration.inHours >= 1) {
        message += " ${23 - dateTime.hour} Hours";
      }
      if (duration.inMinutes >= 1) {
        message += " ${59 - dateTime.minute} Minutes";
      }
      if (duration.inSeconds >= 1) {
        message += " ${59 - dateTime.second} Seconds";
      }
      return message.trim();
    } catch (e) {}
    return "";
  }

  ///
  /// Example:
  /// ```dart
  /// DateTime.now().extension_general_lib_countAgoFromDateTime(
  ///   dateTime: dateTimeStart,
  /// );
  /// ```
  ///
  /// result: example
  /// 1 days 5 minutes 5 seconds
  String extension_general_lib_countAgoFromDateTime({
    required DateTime dateTime,
  }) {
    try {
      final Duration duration = difference(dateTime);
      String message = "";
      if (duration.inDays >= 1) {
        message += "${duration.inDays} Days";
      }
      {
        int result = 60 + hour - dateTime.hour;
        if (result >= 60) {
          result -= 60;
        }
        if (result >= 1) {
          message += " ${result} Hours";
        }
      }
      {
        int result = 60 + minute - dateTime.minute;
        if (result >= 60) {
          result -= 60;
        }
        if (result >= 1) {
          message += " ${result} Minutes";
        }
      }
      {
        int result = 60 + second - dateTime.second;
        if (result >= 60) {
          result -= 60;
        }
        if (result >= 1) {
          message += " ${result} Seconds";
        }
      }
      return message.trim();
    } catch (e) {}
    return "";
  }
}
