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
// /* <!-- START LICENSE -->

// Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION
// Social Media:

// - Youtube: https://youtube.com/@Global_Corporation
// - Github: https://github.com/globalcorporation
// - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

// Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

// Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

// Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

// Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

// Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
// Karena jika ada negosiasi harga kemungkinan

// 1. Software Ada yang di kurangin
// 2. Informasi tidak lengkap
// 3. Bantuan Tidak Bisa remote / full time (Ada jeda)

// Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

// jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ?
// Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap

// <!-- END LICENSE --> */
// import 'package:general_lib/general_lib.dart';
// import 'package:general_lib/language/language_code_data.dart';

// void main(List<String> args) {
//   Language language = Language(
//     regexpReplaces: [
//       RegExpReplace(
//         from: RegExp(""),
//         replace: (match) {
//           return "";
//         },
//       ),
//     ],
//   );
// }

import 'dart:isolate';

import 'package:general_lib/general_lib.dart';

// import 'package:universal_io/io.dart';
extension apslapslpa on bool {}

void main(List<String> args) async {
  print(Dart.pub
      .resolvePackageBase(Uri.parse("package:general_lib/general_lib.dart")));
  Dart.networkLocalIpAddres().then((value) => print(value));
  print("");
  await Isolate.spawnUri(Uri.parse("""
void main(){
  print("slebew);
}
"""), args, []);
}
