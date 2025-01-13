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
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names
//
/// GeneralLibrary
Future<Map> jsonEach({
  required Map data,
  required Future<dynamic> Function(
          dynamic key, dynamic value, bool isList, bool isMapInList)
      builder,
}) async {
  Map jsonData = {};

  for (var element in data.entries) {
    dynamic key = element.key;
    dynamic value = element.value;

    if (value is Map) {
      jsonData[key] = await jsonEach(data: value, builder: builder);
    } else if (value is List) {
      jsonData[key] =
          await jsonListEach(key: key, data: value, builder: builder);
    } else {
      jsonData[key] = await builder(key, value, false, false);
    }
  }

  return jsonData;
}

/// GeneralLibrary
Future<List> jsonListEach({
  required String key,
  required List data,
  required Future<dynamic> Function(
          dynamic key, dynamic value, bool isList, bool isMapInList)
      builder,
}) async {
  List new_data = [];
  for (var e in data) {
    if (e is Map) {
      new_data.add(await jsonEach(data: e, builder: builder));
    } else if (e is List) {
      new_data.add(await jsonListEach(key: key, data: e, builder: builder));
    } else {
      new_data.add(await builder(key, e, true, false));
    }
  }

  return new_data;
}
