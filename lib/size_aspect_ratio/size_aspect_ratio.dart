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
import 'dart:convert';

/// GeneralLibrary
class SizeAspectRatio {
  /// GeneralLibrary
  int width;

  /// GeneralLibrary
  int height;

  /// GeneralLibrary
  SizeAspectRatio({
    required this.width,
    required this.height,
  });

  /// GeneralLibrary
  factory SizeAspectRatio.resize(
    int width,
    int height,
    int maxWidth,
    int maxHeight,
  ) {
    double scaleFactor = (maxWidth / width > maxHeight / height) ? maxHeight / height : maxWidth / width;
    int newWidth = (width * scaleFactor).round();
    int newHeight = (height * scaleFactor).round();
    int finalWidth = newWidth.clamp(0, maxWidth);
    int finalHeight = newHeight.clamp(0, maxHeight);
    return SizeAspectRatio(
      width: finalWidth,
      height: finalHeight,
    );
  }

  /// GeneralLibrary
  SizeAspectRatio resize(
    int maxWidth,
    int maxHeight,
  ) {
    double scaleFactor = (maxWidth / width > maxHeight / height) ? maxHeight / height : maxWidth / width;
    int newWidth = (width * scaleFactor).round();
    int newHeight = (height * scaleFactor).round();
    int finalWidth = newWidth.clamp(0, maxWidth);
    int finalHeight = newHeight.clamp(0, maxHeight);
    return SizeAspectRatio(
      width: finalWidth,
      height: finalHeight,
    );
  }

  /// GeneralLibrary
  void operator []=(key, value) {
    if (key == "width") {
      width = value;
    }
    if (key == "height") {
      height = value;
    }
    return;
  }

  /// GeneralLibrary
  int? operator [](key) {
    if (key == "width") {
      return width;
    }
    if (key == "height") {
      return height;
    }
    return null;
  }

  @override
  String toString() {
    return json.encode({
      "@type": runtimeType.toString(),
      "height": height,
      "width": width,
    });
  }
}
