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

import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:general_lib/general_lib.dart';

class Crypto {
  final String key;
  final String iv;
  const Crypto({
    required this.key,
    this.iv = "AAAAAAAAAAAAAAAAAAAAAA==",
  });

  static String generateKey({
    String scheme = "0123456789abcdefghijklmnopqrstuvwxyz",
  }) {
    return generateUuid(32, text: scheme);
  }

  // static Crypto defaultCrypto() {
  //   return const Crypto(
  //     key: "Xv2CgIFX5J0OPr7VxH2E79ec0OarCSeh",
  //   );
  // }

  const Crypto.defaultCrypto()
      : key = "aFWcpMJ8eqcedhWjY2ZjW5ejDGUeBQoK",
        iv = "WSavXkGwlNwaUwcQAiZtrw==";

  static Crypto empty() {
    return Crypto(key: "");
  }

  String encrypt({
    required String data,
    String? newKey,
    String? iv,
  }) {
    iv ??= this.iv;
    newKey ??= key;

    final encrypter = Encrypter(
      AES(
        Key.fromUtf8(newKey),
        mode: AESMode.ctr,
      ),
    );

    return encrypter.encrypt(data, iv: IV.fromBase64(iv)).base64;
  }

  String decrypt({
    required String data_base64,
    String? newKey,
    String? iv,
  }) {
    iv ??= this.iv;
    newKey ??= key;
    final encrypter = Encrypter(
      AES(
        Key.fromUtf8(newKey),
        mode: AESMode.ctr,
      ),
    );

    return encrypter.decrypt64(data_base64, iv: IV.fromBase64(iv));
  }

  String encryptMapToBase64({
    required Map data,
  }) {
    return encryptToBase64(text: json.encode(data));
  }

  String encryptListToBase64({
    required List data,
  }) {
    return encryptToBase64(text: json.encode(data));
  }

  Uint8List encryptBytes({
    required List<int> data,
    String? key,
    String? iv,
  }) {
    iv ??= this.iv;
    key ??= this.key;
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.encryptBytes(data, iv: IV.fromBase64(iv)).bytes;
  }

  List<int> decryptBytes({
    required List<int> data,
    String? key,
    String? iv,
  }) {
    iv ??= this.iv;
    key ??= this.key;
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.decryptBytes(Encrypted(Uint8List.fromList(data)), iv: IV.fromBase64(iv));
  }

  Uint8List encryptsBytes({
    required List<int> data,
    required List<String> keys,
  }) {
    Uint8List uint8list = Uint8List.fromList(data);
    for (var i = 0; i < keys.length; i++) {
      String key = keys[i];
      uint8list = (encryptBytes(data: uint8list, key: key));
    }
    return uint8list;
  }

  List<int> decryptsBytes({
    required List<int> data,
    required List<String> keys,
  }) {
    List<int> uint8list = data;
    for (var i = keys.length - 1; i > -1; i--) {
      String key = keys[i];
      uint8list = (decryptBytes(data: uint8list, key: key));
    }
    return uint8list;
  }

  String encryptToBase64({
    required String text,
    String? key,
    String? iv,
  }) {
    iv ??= this.iv;
    key ??= this.key;
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));

    return encrypter.encrypt(text, iv: IV.fromBase64(iv)).base64;
  }

  String decryptFromBase64({
    required String text,
    String? key,
    String? iv,
  }) {
    iv ??= this.iv;
    key ??= this.key;
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.decrypt64(text, iv: IV.fromBase64(iv));
  }
}
