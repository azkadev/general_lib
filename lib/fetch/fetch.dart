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
// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:http/http.dart';

/// GeneralLib
Future<Response> fetch(
  String url, {
  FetchOption? options,
  Encoding? encoding,
}) async {
  options ??= FetchOption(
    method: "get",
  );
  String method = (options.method).toLowerCase();

  Response response;
  if (method == "get") {
    response = await get(
      Uri.parse(url),
      headers: options.headers,
    );
  } else if (method == "post") {
    response = await post(Uri.parse(url),
        body: options.body, headers: options.headers, encoding: encoding);
  } else if (method == "put") {
    response = await put(Uri.parse(url),
        body: options.body, headers: options.headers, encoding: encoding);
  } else if (method == "patch") {
    response = await patch(Uri.parse(url),
        body: options.body, headers: options.headers, encoding: encoding);
  } else if (method == "delete") {
    response = await delete(Uri.parse(url),
        body: options.body, headers: options.headers, encoding: encoding);
  } else if (method == "head") {
    response = await head(Uri.parse(url), headers: options.headers);
  } else {
    response = await get(
      Uri.parse(url),
      headers: options.headers,
    );
  }

  return response;
}

/// GeneralLib
extension OnFetch on Response {
  /// GeneralLib
  get text {
    return body;
  }

  /// GeneralLib
  Map? get jsonData {
    try {
      return json.decode(body);
    } catch (e) {
      return null;
    }
  }
}

/// GeneralLib
class FetchOption {
  /// GeneralLib
  String method;

  /// GeneralLib
  Map<String, String>? headers;

  /// GeneralLib
  Object? body;

  /// GeneralLib
  FetchOption({
    required this.method,
    this.headers,
    this.body,
  });
}
