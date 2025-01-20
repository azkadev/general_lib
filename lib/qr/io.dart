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
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:qr/qr.dart';
import 'package:zxing2/qrcode.dart';
import "package:image/image.dart" as img;
import 'dart:typed_data';

/// Generates a QR code from the given [input] string.
class QrGeneralLib {
  /// Generates a QR code from the given [input] string.
  const QrGeneralLib();

  /// Generates a QR code from the given [input] string.
  static void qrPrintToTerminal({required String input, int typeNumber = 5}) {
    print(generateString(input: input, typeNumber: typeNumber));
  }

  /// Check whether it's possible to check row next to [row] based on [oddRow]
  /// and current [moduleCount]
  static bool _checkRow(bool oddRow, int moduleCount, int row) {
    return !oddRow || (row + 1) >= moduleCount;
  }

  /// Generates a QR code from the given [input] string.
  static String generateString({required String input, int typeNumber = 5}) {
    final qrcode = QrCode.fromData(
      data: input,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    final qri = QrImage(qrcode);

    final moduleCount = qrcode.moduleCount;

    // var output = '';
    const whiteAll = '\u{2588}';
    const whiteBlack = '\u{2580}';
    const blackWhite = '\u{2584}';
    const blackAll = ' ';

    final oddRow = moduleCount.isOdd;

    final borderTop =
        Iterable<int>.generate(moduleCount + 2).map((e) => blackWhite).join();
    final borderBottom =
        Iterable<int>.generate(moduleCount + 2).map((e) => whiteBlack).join();

    final output = StringBuffer('${borderTop}\n');

    for (var row = 0; row < moduleCount; row += 2) {
      output.write(whiteAll);

      for (var col = 0; col < moduleCount; col++) {
        if (!qri.isDark(row, col) &&
            (_checkRow(oddRow, moduleCount, row) ||
                !qri.isDark(row + 1, col))) {
          output.write(whiteAll);
        } else if (!qri.isDark(row, col) &&
            (_checkRow(oddRow, moduleCount, row) || qri.isDark(row + 1, col))) {
          output.write(whiteBlack);
        } else if (qri.isDark(row, col) &&
            (_checkRow(oddRow, moduleCount, row) ||
                !qri.isDark(row + 1, col))) {
          output.write(blackWhite);
        } else {
          output.write(blackAll);
        }
      }

      output.write('${whiteAll}\n');
    }

    if (!oddRow) output.write(borderBottom);

    return output.toString();
  }

  /// Generates a QR code from the given [input] string.
  static Uint8List generateImagePngBytes({
    required String text,
  }) {
    final qrcode = Encoder.encode(text, ErrorCorrectionLevel.h);
    final matrix = qrcode.matrix!;
    final scale = 10;
    final width = matrix.width * scale;
    final height = matrix.height * scale;

    final img.Image image = img.Image(
      width: width + 200,
      height: height + 200,
    );
    img.fill(image, color: img.ColorRgba8(255, 255, 255, 0xFF));

    final xs = [];
    for (var x = 0; x < matrix.width; x++) {
      for (var y = 0; y < matrix.height; y++) {
        if (matrix.get(x, y) == 1) {
          xs.add([x + 10, y + 10]);
        }
      }
    }

    for (var i = 0; i < xs.length; i++) {
      var x = xs[i][0];
      var y = xs[i][1];

      img.fillRect(
        image,
        x1: x * scale,
        y1: y * scale,
        x2: x * scale + scale,
        y2: y * scale + scale,
        color: img.ColorRgba8(0, 0, 0, 0xFF),
      );
    }
    return img.encodePng(image);
  }

  /// Generates a QR code from the given [input] string.
  static String readImagePng({
    required Uint8List bytes,
  }) {
    final image = img.decodePng(bytes)!;
    final LuminanceSource source = RGBLuminanceSource(
        image.width,
        image.height,
        image
            .convert(numChannels: 4)
            .getBytes(order: img.ChannelOrder.rgba)
            .buffer
            .asInt32List());
    final bitmap = BinaryBitmap(HybridBinarizer(source));
    final reader = QRCodeReader();
    final result = reader.decode(bitmap);
    return result.text;
  }
}
