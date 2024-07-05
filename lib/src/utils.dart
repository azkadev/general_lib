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
String convertToAgo(int? timestamp) {
  try {
    Duration diff = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(
            timestamp ?? DateTime.now().millisecondsSinceEpoch));

    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s) ago';
    } else if (diff.inMilliseconds >= 1) {
      return '${diff.inMilliseconds} millisecond(s) ago';
    } else if (diff.inMicroseconds >= 1) {
      return '${diff.inMicroseconds} microsecond(s) ago';
    } else {
      return "just now";
    }
  } catch (e) {
    return 'just now';
  }
}

String convertToAgoFromDateTime(DateTime dateTime) {
  try {
    Duration diff = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch));
    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s) ago';
    } else if (diff.inMilliseconds >= 1) {
      return '${diff.inMilliseconds} millisecond(s) ago';
    } else if (diff.inMicroseconds >= 1) {
      return '${diff.inMicroseconds} microsecond(s) ago';
    } else {
      return "just now";
    }
  } catch (e) {
    return 'just now';
  }
}
