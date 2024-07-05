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
// ignore_for_file: unnecessary_brace_in_string_interps, empty_catches

String jsonToMessage(
  Map data, {
  bool isHtml = false,
  required Map jsonFullMedia,
  bool isRoot = true,
  String space = "",
}) {
  if (!isRoot && space.isEmpty) {
    space = "  ";
  }
  String parseHtmlLink(String text, String links) {
    return "<a href='$links'>$text</a>";
  }

  String parseHtmlCode(String text) {
    return "<code>$text</code>";
  }

  String message = "";
  data.forEach((key, loopData) {
    try {
      if (loopData is Map) {
        message += "\n${space}${key}: ${jsonToMessage(
          loopData,
          isHtml: isHtml,
          jsonFullMedia: jsonFullMedia,
          isRoot: false,
          space: space * 8,
        )}";
      } else if (loopData is List) {
        message += "\n${space}${key}: ";
        String listToMessage({
          required List datas,
        }) {
          String message = "";
          for (var i = 0; i < datas.length; i++) {
            var loopData = datas[i];
            if (loopData is Map) {
              message += jsonToMessage(
                loopData,
                isHtml: isHtml,
                jsonFullMedia: jsonFullMedia,
                isRoot: false,
                space: space * 8,
              );
            } else if (loopData is List) {
              message += "\n${listToMessage(datas: loopData)}";
            } else {
              message += "\n${loopData}";
            }
          }
          return message;
        }

        message += listToMessage(datas: loopData);
      } else {
        if (loopData is bool) {
          loopData = (jsonFullMedia[loopData] ?? loopData);
        } else if (loopData is int) {
          if (isHtml) {
            loopData = parseHtmlCode(loopData.toString());
          }
        } else {
          if (isHtml) {
            loopData = parseHtmlCode(loopData.toString());
          }
        }
        if (key == "id") {
          if (isHtml) {
            loopData = parseHtmlCode(loopData.toString());
          }
        }
        if (key == "username") {
          loopData = ("@${data[key]}");
        }
        if (key == "first_name") {
          if (data["last_name"] is String) {
            loopData = (data[key] + " " + data["last_name"]);
          }
          if (isHtml) {
            loopData = (parseHtmlLink(
                data[key].toString(), "tg://user?id=${data["id"].toString()}"));
          }
        }
        if (key == "language_code") {
          loopData = (jsonFullMedia["language_code_${data[key]}"] ??
              loopData.toString());
        }
        message +=
            "\n${space}${(jsonFullMedia[key] != null) ? jsonFullMedia[key] : key}: $loopData";
      }
    } catch (e) {}
  });
  return message;
}
