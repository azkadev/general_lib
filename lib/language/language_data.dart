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
// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:general_lib/scheme/language_code_data_detail.dart';
import 'package:general_lib/schemes/language_code.dart';

/// GeneralLib
final Map<String, LanguageCodeDataDetail> languageCodeDetailData = () {
  final Map<String, LanguageCodeDataDetail> jsonData = {};
  for (var element in languageCodeJson.entries) {
    final dynamic key = element.key;
    final dynamic value = element.value;
    if (value is Map) {
      if (key is String) {
        jsonData[key] = LanguageCodeDataDetail(value);
      }
    }
  }
  return jsonData;
}.call();

/// GeneralLib
final List<String> languageCodeNames =
    languageCodeJson.keys.whereType<String>().toList();

/// GeneralLib
extension LanguageCodeDataDetailGeneralLibExtensions
    on Map<String, LanguageCodeDataDetail> {
  /// GeneralLib
  Future<LanguageCodeDataDetail?> languageDetailDataQuery({
    required Future<bool> Function(LanguageCodeDataDetail languageDetailData)
        onData,
  }) async {
    for (var element in entries) {
      final LanguageCodeDataDetail value = element.value;
      final bool is_return_data = await onData(value);
      if (is_return_data) {
        return value;
      }
    }

    return null;
  }

  /// GeneralLib
  LanguageCodeDataDetail? languageDetailDataQuerySync({
    required bool Function(LanguageCodeDataDetail languageDetailData) onData,
  }) {
    for (var element in entries) {
      final LanguageCodeDataDetail value = element.value;

      final bool is_return_data = onData(value);
      if (is_return_data) {
        return value;
      }
    }

    return null;
  }

  /// GeneralLib
  Future<LanguageCodeDataDetail> languageDetailDataQueryForce({
    required Future<bool> Function(LanguageCodeDataDetail languageDetailData)
        onData,
    required LanguageCodeDataDetail defaultLanguageCodeDataDetail,
  }) async {
    return (await languageDetailDataQuery(onData: onData)) ??
        defaultLanguageCodeDataDetail;
  }

  /// GeneralLib
  LanguageCodeDataDetail languageDetailDataQueryForceSync({
    required bool Function(LanguageCodeDataDetail languageDetailData) onData,
    required LanguageCodeDataDetail defaultLanguageCodeDataDetail,
  }) {
    return languageDetailDataQuerySync(onData: onData) ??
        defaultLanguageCodeDataDetail;
  }

  /// GeneralLib
  LanguageCodeDataDetail? languageDetailDataGetByPhoneCode({
    required RegExp regExpPhoneCode,
  }) {
    for (var element in entries) {
      final LanguageCodeDataDetail value = element.value;
      if (value.dial_code is String == false) {
        continue;
      }
      if ((value.dial_code as String).isEmpty) {
        continue;
      }

      if (regExpPhoneCode.hasMatch(value.dial_code ?? "")) {
        return value;
      }
    }

    return null;
  }
}
