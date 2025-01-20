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
import 'package:general_lib/schemes/language_code.dart';

/// GeneralLib
final List<Map<String, dynamic>> schemes = [
  {
    "@type": "captchaResult",
    "type": "words",
    "emoji_answer": {
      "@type": "emoji",
    },
    "random_words": [""],
    "words": [""]
  },
  {
    "@type": "captchaWord",
    "answer": [3, 5, 3],
    "words": [
      "satu",
      "dua",
      "tiga",
      "empat",
      "lima",
      "enam",
      "tujuh",
    ],
  },
  {
    "@type": "durationDataScheme",
    "days": 0,
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "milliseconds": 0,
    "microseconds": 0
  },
  {
    "@type": "durationData",
    "days": 0,
    "hours": 0,
    "minutes": 0,
    "seconds": 0,
    "milliseconds": 0,
    "microseconds": 0
  },
  {
    "@type": "regExpDataScheme",
    "pattern": "",
    "is_multi_line": false,
    "is_case_sensitive": false,
    "is_unicode": false,
    "is_dot_all": false
  },
  {"@type": "socketConnection", "status": "connect"},
  {"@type": "socketError", "message": "", "description": "", "error": "e"},
  {
    "@type": "languageCodeData",
    ...languageCodeJson,
  },
];
