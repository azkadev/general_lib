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
// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_brace_in_string_interps
//
import 'package:general_lib/regexp_replace/regexp_replace.dart';
import 'package:general_lib/scheme/language_code_data.dart';

/// GeneralLib
class Language {
  /// GeneralLib
  String language_code = "id";

  /// GeneralLib
  List<RegExpReplace> regexp_replaces = [];

  /// GeneralLib
  Language({
    String languageCode = "id",
    required List<RegExpReplace> regexpReplaces,
  }) {
    language_code = languageCode;
    regexp_replaces = regexpReplaces;
  }

  /// GeneralLib
  String sendLanguage({
    required LanguageCodeData languageCodeData,
    required String id,
    List<RegExpReplace>? regexpReplaces,
    String? languageCode,
  }) {
    languageCode ??= language_code;
    regexpReplaces ??= regexp_replaces;
    try {
      String language_result = languageCodeData[languageCode] ??
          languageCodeData["id"] ??
          "Translation not found\n\n${id}: Tidak ada bahasa ${languageCode}";
      if (language_result.isEmpty) {
        language_result =
            "Translation not found\n\n${id}: Tidak ada bahasa ${languageCode}";
      }

      return variableMessage(
        text: language_result,
        regexpReplaces: regexpReplaces,
      );
    } catch (e) {
      return "LanguageBot error\nId: ${id}\nRes: ${e.toString()}";
    }
  }

  /// GeneralLib
  String variableMessage({
    required String text,
    List<RegExpReplace>? regexpReplaces,
    bool isThrowOnError = false,
  }) {
    regexpReplaces ??= regexp_replaces;
    try {
      String message = "";
      message = text;
      for (var i = 0; i < regexpReplaces.length; i++) {
        RegExpReplace regExpReplace = regexpReplaces[i];
        try {
          message = message.replaceAllMapped(
              regExpReplace.from, regExpReplace.replace);
        } catch (e) {
          if (isThrowOnError) {
            rethrow;
          }
        }
      }

      return message;
    } catch (e) {
      if (isThrowOnError) {
        rethrow;
      }
      return text;
    }
  }
}
